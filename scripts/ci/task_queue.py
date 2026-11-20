#!/usr/bin/env python3
"""Persistent, evidence-driven task queue (Sponsor Directive §1 / §3).

Rebuilt from the pinned inventory and snapshots, but MERGED with the persistent
state ledger (data/TASK_STATE.json) so ownership, blockers, attempts, evidence
artifacts and review trails survive regeneration and session restarts.

Each work unit is one NORMATIVE UNIT (not one article), with:

  * a collision-resistant id built from law id + history revision id +
    本則/附則/別表 + 条項号細目/別表セル path + unit kind + content hash;
  * an exact source locator (structural path and normalised character span)
    and a sha256 of the pinned source fragment;
  * an independent decomposition-coverage audit; unresolved source text is
    recorded, never silently dropped;
  * structured dependencies (law name + article + enforcement version) parsed
    from the provision itself. Bare 15-digit numbers are raw evidence only;
  * independent status axes and an explicit completion state;
  * FULL_ARTICLE / COMPUTABLE_SLICE_ONLY / UNRESOLVED_SCOPE.

A pinned literal needle, the existence of a Lean file, or a matching theorem
name NEVER sets a terminal state. Only recorded, externally produced evidence
in data/TASK_STATE.json can do that (see normative_units.derive_state).

Regenerate with `python scripts/ci/task_queue.py`; deterministic gate.
"""
from __future__ import annotations

import json
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from normative_units import (  # noqa: E402
    DEFAULT_STATE, DONE_STATES, EVIDENCE_KEYS, STATES,
    audit_decomposition, decompose, derive_state, extract_dependencies,
    _laws_index, current_article_from_path, load_state, normative_id,
    readable_ref, sha256_text,
)

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
OUT_JSON = REPO / "build" / "task_queue.json"
OUT_UNRESOLVED = REPO / "build" / "unresolved_blocks.json"
OUT_MD = REPO / "docs" / "TASK_QUEUE.md"


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    sweep = json.loads(SWEEP.read_text(encoding="utf-8")) if SWEEP.exists() else {}
    sw_status = sweep.get("laws", {}) if isinstance(sweep.get("laws"), dict) else {}

    state = load_state()
    dep_index = _laws_index(laws)  # build once; reuse for every normative unit
    tasks = []
    unresolved_blocks = []

    for law in laws:
        lid = law.get("law_id", "")
        rev = (law.get("current_revision") or {}).get("law_revision_id", "")
        rev_status = (law.get("current_revision") or {}).get(
            "current_revision_status", law.get("current_revision_status", "")
        )
        enforcement = (law.get("current_revision") or {}).get("amendment_enforcement_date", "")
        sf = (law.get("raw_snapshot") or {}).get("source_file")
        if not sf:
            continue
        p = REPO / sf
        if not p.exists():
            continue
        raw = p.read_text(encoding="utf-8")
        doc = json.loads(raw)
        source_sha = (law.get("raw_snapshot") or {}).get("source_sha256") or sha256_text(raw)
        # Tree identity is the pinned file identity: avoid re-serialising a
        # multi-megabyte JSON tree for every law.
        full_text = source_sha

        for block_ordinal, (path, text, _node) in enumerate(
            iter_blocks_local(doc.get("law_full_text"))
        ):
            units = decompose(path, text)
            audit = audit_decomposition(text, units)
            unresolved_units = [
                {"locator": u["locator"], "char_start": u["char_start"],
                 "char_end": u["char_end"], "sha256": u["sha256"]}
                for u in units if u["kind"] == "UNRESOLVED"
            ]
            block_sha = sha256_text(text)
            if not audit["decomposition_ok"]:
                # A block that cannot be fully decomposed is NOT a
                # schedulable verification unit. Record it explicitly for the
                # SOURCE agent instead of inventing obligations for text we
                # have not understood.
                unresolved_blocks.append({
                    "law_id": lid,
                    "revision_id": rev,
                    "source_file": sf,
                    "provision_path": list(path),
                    "block_ordinal": block_ordinal,
                    "block_sha256": block_sha,
                    "source_chars": audit["source_chars"],
                    "unresolved_chars": audit["unresolved_chars"],
                    "gap_chars": audit["gap_chars"],
                    "overlap_chars": audit["overlap_chars"],
                    "unit_kinds": [u["kind"] for u in units],
                    "unresolved_units": unresolved_units,
                    "status": "UNRESOLVED",
                })
                continue
            if audit["classified_chars"] == audit["source_chars"] and len(units) == 1:
                scope = "FULL_ARTICLE"
            else:
                scope = "COMPUTABLE_SLICE_ONLY"

            for u in units:
                tid = normative_id(lid, rev, path, u["index"], u["kind"], u["text"],
                                   block_ordinal=block_ordinal)
                # Dependencies are a property of this normative unit, not of the
                # whole article: an exception's delegation must not be inherited
                # by the neighbouring condition.
                deps = extract_dependencies(
                    u["text"], laws, index=dep_index,
                    context={"law_id": lid, "revision_id": rev,
                             "article": current_article_from_path(path)},
                )
                task = {
                    "task_id": tid,
                    "normative_ref": readable_ref(lid, rev, path, u["index"],
                                                  block_ordinal),
                    "law_id": lid,
                    "law_title": law.get("official_title", ""),
                    "revision_id": rev,
                    "revision_status": rev_status,
                    "enforcement_date": enforcement,
                    "source_file": sf,
                    "source_sha256": source_sha,
                    "source_tree_sha256": full_text,
                    "provision_path": list(path),
                    "block_sha256": block_sha,
                    "block_ordinal": block_ordinal,
                    "unit": {
                        "index": u["index"],
                        "block_ordinal": block_ordinal,
                        "kind": u["kind"],
                        "cue": u["cue"],
                        "char_start": u["char_start"],
                        "char_end": u["char_end"],
                        "locator": u["locator"],
                        "sha256": u["sha256"],
                        "text": u["text"][:240],
                    },
                    "decomposition": {
                        "unit_count": len(units),
                        "audit": audit,
                        "unresolved_units": unresolved_units,
                    },
                    "dependencies": deps,
                    "obligations": list(EVIDENCE_KEYS),
                    "status": {
                        "completion_state": DEFAULT_STATE,
                        "source_fixed": True,
                        "structure_identified": True,
                        "decomposition_audited": audit["decomposition_ok"],
                        "legal_review": "LEGAL_REVIEW_PENDING",
                    },
                    "scope": scope,
                    "priority": 1 if not deps["unresolved_dependency_count"] else 3,
                    "audit_sweep_status": sw_status.get(lid, {}).get("status", "-"),
                }
                rec = state["tasks"].get(tid, {})
                defaults = {
                    "completion_state": DEFAULT_STATE,
                    "owner": "", "attempts": 0, "claimed_at": "",
                    "blockers": [], "artifacts": {}, "evidence": {},
                    "history": [],
                    "review": {"reviewer": "", "review_date": "", "verdict": ""},
                    "source_sha256": source_sha,
                }
                for k, v in defaults.items():
                    rec.setdefault(k, v)
                task["status"]["completion_state"] = derive_state(rec, task)
                task["status"]["axes"] = {
                    k: bool(k in (rec.get("evidence") or {}))
                    for k in EVIDENCE_KEYS
                }
                task["status"]["owner"] = rec.get("owner", "")
                task["status"]["attempts"] = int(rec.get("attempts", 0))
                task["status"]["blockers"] = list(rec.get("blockers", []))
                tasks.append(task)

    # fail loudly on any id collision instead of silently overwriting
    ids = [t["task_id"] for t in tasks]
    if len(ids) != len(set(ids)):
        dup = [k for k, n in Counter(ids).items() if n > 1]
        raise SystemExit(f"normative id collision: {len(dup)} ids; first={dup[:3]}")

    # Read-only with respect to the durable ledger: regeneration must never
    # erase ownership, blockers or evidence. Sparse records are written only by
    # the selector/outcome tools, so a never-worked corpus creates no huge
    # state file.
    payload = {
        "tool": "scripts/ci/task_queue.py",
        "schema": 2,
        "inventory_snapshot_date": inv.get("snapshot_date", ""),
        "laws_total": len(laws),
        "units_total": len(tasks),
        "unresolved_blocks_total": len(unresolved_blocks),
        "unresolved_detail_file": "build/unresolved_blocks.json",
        "states": list(STATES),
        "obligations": list(EVIDENCE_KEYS),
        "state_axes_are_independent": True,
        "needle_or_filename_never_completes": True,
        "tasks": tasks,
    }
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(
        json.dumps(payload, ensure_ascii=False, separators=(",", ":")),
        encoding="utf-8",
    )
    OUT_UNRESOLVED.write_text(
        json.dumps({"unresolved_blocks": unresolved_blocks},
                   ensure_ascii=False, separators=(",", ":")),
        encoding="utf-8",
    )

    counts = Counter(t["status"]["completion_state"] for t in tasks)
    kinds = Counter(t["unit"]["kind"] for t in tasks)
    scopes = Counter(t["scope"] for t in tasks)
    unresolved = sum(1 for t in tasks if t["decomposition"]["unresolved_units"])
    unresolved_deps = sum(1 for t in tasks if t["dependencies"]["unresolved_dependency_count"])

    lines = [
        "# Persistent task queue (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.",
        "",
        "One work unit = one normative unit (condition / effect / exception /",
        "fiction / presumption / delegation / reading-substitution / reference /",
        "definition / procedure / transitional / penalty / UNRESOLVED) with an",
        "exact 本則・附則・別表・条項号細目・別表セル locator and a sha256 of the",
        "pinned source fragment. IDs are full 64-hex hashes over law id, history",
        "revision id, structural path, unit kind and content hash.",
        "",
        "Persistent state lives in `data/TASK_STATE.json` and is MERGED, never",
        "overwritten: owner, attempts, blockers, evidence artifacts and review",
        "trails survive regeneration and session restarts.",
        "",
        "A needle match, a file's existence or a theorem-name string match is",
        "NEVER sufficient for a terminal state; see `scripts/ci/normative_units.py`.",
        "",
        "## Counts (separate axes)",
        "",
        f"- laws in inventory: {len(laws)}",
        f"- normative units generated: {len(tasks)}",
        f"- UNRESOLVED decomposition units: {kinds.get('UNRESOLVED', 0)}",
        f"- UNRESOLVED blocks (not schedulable; see build/unresolved_blocks.json): "
        f"{len(unresolved_blocks)}",
        f"- units with unresolved source characters: {unresolved}",
        f"- units with unresolved dependencies: {unresolved_deps}",
        "",
        "| completion state | units |",
        "|---|---:|",
        *[f"| {s} | {counts.get(s, 0)} |" for s in STATES],
        "",
        "| scope | units |",
        "|---|---:|",
        *[f"| {s} | {scopes.get(s, 0)} |" for s in
          ("FULL_ARTICLE", "COMPUTABLE_SLICE_ONLY", "UNRESOLVED_SCOPE")],
        "",
        "| unit kind | units |",
        "|---|---:|",
        *[f"| {k} | {kinds.get(k, 0)} |" for k in sorted(kinds)],
        "",
        "## Sample not-yet-complete units (first 20)",
        "",
        "| normative_ref | law_id | article | kind | state |",
        "|---|---|---|---|---|",
    ]
    for t in [x for x in tasks if x["status"]["completion_state"] not in DONE_STATES][:20]:
        lines.append(
            f"| `{t['normative_ref'][:48]}` | {t['law_id']} | "
            f"{t['unit']['locator'].split('@')[0]} | {t['unit']['kind']} | "
            f"{t['status']['completion_state']} |"
        )
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(
        f"task queue: {len(tasks)} normative units across {len(laws)} laws; "
        + ", ".join(f"{s}={counts.get(s, 0)}" for s in STATES)
    )
    return 0


def iter_blocks_local(node, path=()):
    """Local wrapper kept explicit so the queue does not depend on audit pins."""
    from normative_units import iter_blocks
    return iter_blocks(node, path)


if __name__ == "__main__":
    sys.exit(main())
