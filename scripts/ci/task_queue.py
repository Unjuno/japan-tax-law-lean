#!/usr/bin/env python3
"""Persistent normative-unit task queue (Directive §1, execution task 1).

One durable work unit per decomposed normative unit - not per article and not
per numeric needle.  All identifiers, decomposition, dependency analysis and
status derivation come from the single core `normative_core.py`.

Completion is NEVER inferred from a numeric match, a file's existence or a
theorem-name string match: the status is derived only from recorded evidence
in data/verification_evidence.json (which is absent by default, so every unit
starts NOT_STARTED).  Human legal review is a separate axis.

Regenerate with `python scripts/ci/task_queue.py`.
"""
from __future__ import annotations

import hashlib
import json
import os
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import normative_core as core  # noqa: E402

# Tolerate the two status-tuple spellings used by concurrent core revisions.
STATUSES = getattr(core, "STATUSES", None) or getattr(core, "STATUS_VALUES")

REPO = HERE.parents[1]
INVENTORY = REPO / "data" / "INVENTORY.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
QUEUE_JSON = REPO / "build" / "task_queue.json"
QUEUE_MD = REPO / "docs" / "TASK_QUEUE.md"
INDEX_JSON = REPO / "data" / "QUEUE_INDEX.json"
STATE_PATH = REPO / "data" / "task_state.json"
EVIDENCE_PATH = REPO / "data" / "verification_evidence.json"

OBLIGATIONS = tuple(core.EVIDENCE_AXES) + ("LEGAL_REVIEW",)


def article_key(value) -> str:
    return core.article_key(value)


def flat(node) -> str:
    return core.flat(node)


def iter_articles(node, path=()):
    """Yield (path, article_node) for Main/Supplementary/Appendix articles."""
    if isinstance(node, dict):
        tag = node.get("tag", "")
        if tag in ("MainProvision", "SupplProvision", "AppdxTable"):
            pnum = str((node.get("attr") or {}).get("Num", ""))
            path = path + (tag + (f"#{pnum}" if pnum else ""),)
        if tag == "Article":
            anum = str((node.get("attr") or {}).get("Num", ""))
            yield path + (f"Article:{anum}",), node
            return
        # Sibling index is part of the path: e-Gov Supplementary provisions
        # frequently repeat the same (empty) Num and article numbers. Without
        # the index, 67 distinct provisions collapse to one structural path and
        # their normative ids collide (§1.1 requires collision-free ids).
        for i, child in enumerate(node.get("children", []) or []):
            child_path = path + (f"{tag}[{i}]",) if tag in (
                "MainProvision", "SupplProvision", "AppdxTable", "LawBody"
            ) else path
            yield from iter_articles(child, child_path)
    elif isinstance(node, list):
        for i, child in enumerate(node):
            yield from iter_articles(child, path + (f"list[{i}]",))


def build_tasks(inv: dict) -> list[dict]:
    laws = inv.get("laws", [])
    law_index = core.build_law_index(laws)
    tasks: list[dict] = []
    for law in laws:
        lid = law.get("law_id", "")
        rev = str((law.get("current_revision") or {}).get("law_revision_id", ""))
        # INVENTORY.json stores the enforced date as `amendment_enforcement_date`
        # (some snapshots also carry `enforcement_date`). Leaving it empty
        # collapses every law's dependency key to (law, article, "") and makes
        # the selector treat different enforced versions as equivalent.
        enforcement = str(
            (law.get("current_revision") or {}).get("enforcement_date")
            or (law.get("current_revision") or {}).get("amendment_enforcement_date")
            or ""
        )
        sf = (law.get("raw_snapshot") or {}).get("source_file")
        if not sf or not (REPO / sf).exists():
            # Absent snapshot is recorded as BLOCKED, never silently skipped.
            tasks.append({
                "normative_id": core.make_normative_id(
                    lid, rev or "HISTORY_UNKNOWN", "SOURCE", lid, "", "", "",
                    "", "", "", 0, "BLOCKED", lid,
                ),
                "law_id": lid,
                "revision": rev,
                "status": core.STATUS_BLOCKED,
                "blocked_reason": "SOURCE_SNAPSHOT_UNAVAILABLE",
                "blockers": [{"reason": "SOURCE_SNAPSHOT_UNAVAILABLE",
                              "resolved": False}],
                "unresolved_conditions": ["SOURCE_SNAPSHOT_UNAVAILABLE"],
                "dependencies": [],
            })
            continue
        raw = (REPO / sf).read_bytes()
        source_sha = hashlib.sha256(raw).hexdigest()
        doc = json.loads(raw)
        root = doc.get("law_full_text")
        for path, article in iter_articles(root):
            anum = str((article.get("attr") or {}).get("Num", ""))
            if not anum:
                continue
            record = core.decompose_article(
                article, lid, rev or f"HISTORY_UNKNOWN:{source_sha}", anum,
                enforcement, law_index, outer_path=path,
            )
            for unit in record["units"]:
                unit.update({
                    "unit_id": unit["id"],
                    "normative_id": unit["id"],
                    "law_title": law.get("official_title", ""),
                    "revision": rev,
                    "source_file": sf,
                    "source_sha256": source_sha,
                    # core.decompose_article already provides the precise
                    # structural path (paragraph/item/subitem/cell); keep it.
                    "norm_fragment": unit["text"][:240],
                    "norm_type": unit.get("kind", ""),
                    "article_title": "",
                    "coverage": record["coverage"],
                    "obligations": list(OBLIGATIONS),
                    "scope": "FULL_ARTICLE" if record["coverage"]["status"] == "COVERED"
                             and not unit["unhandled_conditions"] else "COMPUTABLE_SLICE_ONLY",
                    "legal_review": core.LEGAL_REVIEW_PENDING,
                    "owner": "",
                    "evidence": {},
                    "blockers": [],
                })
                tasks.append(unit)
    return tasks


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    state = core.load_state(STATE_PATH)
    evidence = {}
    if EVIDENCE_PATH.exists():
        evidence = json.loads(EVIDENCE_PATH.read_text(encoding="utf-8")).get("units", {})
    tasks = build_tasks(inv)
    state, notes = core.merge_state(state, tasks)
    for task in tasks:
        uid = task["normative_id"]
        saved = state["units"].get(uid, {})
        task["owner"] = saved.get("owner", "")
        task["blockers"] = saved.get("blockers") or task.get("blockers", [])
        task["artifacts"] = saved.get("artifacts", {})
        task["legal_review"] = saved.get("legal_review", core.LEGAL_REVIEW_PENDING)
        task["unhandled_conditions"] = saved.get("unhandled_conditions") or task.get("unhandled_conditions", [])
        derived, errors = core.derive_status(task, evidence.get(uid, {}))
        task["status"] = derived
        task["status_errors"] = errors
        task["completion_claim"] = False
    counts = {s: sum(1 for t in tasks if t["status"] == s) for s in core.STATUS_VALUES}
    payload = {
        "tool": "scripts/ci/task_queue.py",
        "schema": "normative-unit-queue-v3",
        "inventory_snapshot_date": inv.get("snapshot_date", ""),
        "laws_total": len(inv.get("laws", [])),
        "units_total": len(tasks),
        "status_counts": counts,
        "status_values": list(core.STATUS_VALUES),
        "obligations": list(OBLIGATIONS),
        "legal_review_axis": "independent; never auto-satisfied",
        "completion_rule": "status derives only from recorded evidence",
    }
    QUEUE_JSON.parent.mkdir(parents=True, exist_ok=True)
    # Compact per-article index: consumers such as article_obligations.py only
    # need one representative unit and its coverage per (law, article). Reading
    # the ~700 MB task array for that caused MemoryError under CI pressure.
    index: dict[str, dict] = {}
    # Stream the task array. Building one ~700 MB string via json.dumps() on
    # top of ~400k task dicts caused MemoryError under CI memory pressure.
    # json.dump() writes each encoded task incrementally to a temp file, which
    # is then atomically renamed: a concurrent reader must never observe a
    # partially written (and therefore unparsable) ~800 MB queue.
    tmp = QUEUE_JSON.with_name(QUEUE_JSON.name + f".tmp.{os.getpid()}")
    try:
        with tmp.open("w", encoding="utf-8") as fh:
            head = json.dumps(payload, ensure_ascii=False, separators=(",", ":"))
            fh.write(head[:-1] + ",\"tasks\":[")
            for i, task in enumerate(tasks):
                if i:
                    fh.write(",")
                json.dump(task, fh, ensure_ascii=False, separators=(",", ":"))
                key = f"{task.get('law_id', '')}|{article_key(task.get('article', ''))}"
                entry = index.setdefault(key, {
                    "law_id": task.get("law_id", ""),
                    "article": task.get("article", ""),
                    "unit_count": 0,
                    "unit_id": task.get("id", task.get("normative_id", "")),
                    "coverage": task.get("coverage", {}).get("status", "PARTIAL"),
                })
                entry["unit_count"] += 1
            fh.write("]}")
            fh.flush()
            os.fsync(fh.fileno())
        for attempt in range(5):
            try:
                os.replace(tmp, QUEUE_JSON)
                break
            except PermissionError:
                if attempt == 4:
                    raise
                time.sleep(0.5 * (attempt + 1))
    finally:
        if tmp.exists():
            tmp.unlink()
    INDEX_JSON.parent.mkdir(parents=True, exist_ok=True)
    INDEX_JSON.write_text(json.dumps({
        "tool": "scripts/ci/task_queue.py",
        "units_total": len(tasks),
        "articles": sorted(index.values(), key=lambda r: (r["law_id"], r["article"])),
    }, ensure_ascii=False, separators=(",", ":")), encoding="utf-8")
    lines = [
        "# Persistent normative-unit task queue (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.",
        "",
        "Identifiers bind law id, enforced revision, provision, article,",
        "paragraph, item, subitem, table cell, ordinal, norm kind and source",
        "digest (full SHA-256). Status derives only from recorded evidence;",
        "a needle match, file existence or theorem name is never completion.",
        "",
        f"- snapshot: {inv.get('snapshot_date', '')}",
        f"- laws: {len(inv.get('laws', []))}",
        f"- normative units: {len(tasks)}",
        "",
        "| status | units |",
        "|---|---:|",
    ]
    lines += [f"| {s} | {counts[s]} |" for s in core.STATUS_VALUES]
    lines.append("")
    QUEUE_MD.write_text("\n".join(lines), encoding="utf-8")
    if "--persist" in sys.argv:
        core.save_state(state, STATE_PATH)
    print(f"normative-unit queue: {len(tasks)} units; "
          + ", ".join(f"{s}={counts[s]}" for s in core.STATUS_VALUES))
    print(f"state merge: {len(notes)} change(s)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
