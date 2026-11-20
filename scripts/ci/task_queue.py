#!/usr/bin/env python3
"""Persistent normative-unit task queue (Directive §1).

One durable work unit per decomposed norm unit, with a full-SHA-256 identity,
an exact source position, evidence slots and evidence-derived status.  No unit
is ever completed by a numeric match, a file existence check or a theorem-name
string match.  Regeneration merges with the git-tracked state file so owner,
blockers, artifacts and review evidence survive (§1.7).

Regenerate with `python scripts/ci/task_queue.py` (deterministic, exit 0).
Use `--persist` to write the merged state file (timestamps make it non-deterministic).
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path

from normative_core import (
    INVENTORY, QUEUE_JSON, REPO, STATE_PATH, NOT_STARTED, STALE, STATUSES,
    ACTIVE_STATUSES, NORM_KINDS, OBLIGATIONS, MECHANICAL_AXES,
    LEGAL_REVIEW_PENDING, UNRESOLVED_KINDS,
    assert_unique, audit_coverage, canonical_norm_id, clean_proof,
    completion_claim, decompose, derive_status, flat, law_title_index,
    load_evidence, load_state, merge_state, norm_text, parse_dependencies,
    path_parts, provision_of, save_state, sha256_text, walk_provisions,
)

OUT_MD = REPO / "docs" / "TASK_QUEUE.md"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"


def _pin_hints() -> dict:
    """Advisory only: which law ids have a pinned literal check.

    This NEVER sets a status.  It merely tells the coordinator where a
    fidelity check already exists (Directive §1.4).
    """
    if not AUDIT.exists():
        return {}
    spec = importlib.util.spec_from_file_location("tq_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    covered = {}
    for _name, law_id, _kind, art, _needles in mod.checks():
        covered.setdefault(law_id, []).append(art or "(file-level)")
    return covered


def _title_of(node) -> str:
    for child in node.get("children", []):
        if isinstance(child, dict) and child.get("tag") == "ArticleTitle":
            return norm_text(flat(child))
    return ""


def _article_number(node) -> str:
    return norm_text(str((node.get("attr") or {}).get("Num", "")))


def build_units() -> list[dict]:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    hints = _pin_hints()
    titles = law_title_index(inv)
    units = []

    for law in laws:
        law_id = law["law_id"]
        revision = str((law.get("current_revision") or {}).get("law_revision_id", ""))
        history = str((law.get("current_revision") or {}).get("amendment_law_id", ""))
        enforcement = str((law.get("current_revision") or {}).get(
            "amendment_enforcement_date", ""))
        source_file = (law.get("raw_snapshot") or {}).get("source_file", "")
        if not source_file:
            continue
        path = REPO / source_file
        if not path.exists():
            continue
        raw = path.read_bytes()
        source_sha = hashlib.sha256(raw).hexdigest()
        doc = json.loads(raw)
        root = doc.get("law_full_text", doc)

        for structural_path, node in walk_provisions(root):
            tag = structural_path[-1].split(":", 1)[0] if structural_path else ""
            if tag not in ("Article", "TableRow"):
                continue
            text = norm_text(flat(node))
            if not text:
                continue
            parts = path_parts(structural_path)
            provision = provision_of(structural_path)
            article_title = _title_of(node) if tag == "Article" else ""
            article_no = parts["article"] or (article_title or "APPENDIX_TABLE")
            segments = decompose(text)
            coverage = audit_coverage(text, segments)

            for unit in segments:
                fragment = unit["text"]
                fragment_sha = sha256_text(norm_text(fragment))
                ident = canonical_norm_id(
                    law_id=law_id, revision_id=revision, history_id=history,
                    provision=provision, article=parts["article"],
                    paragraph=parts["paragraph"], item=parts["item"],
                    subitem=parts["subitem"], table=parts["table"],
                    cell=parts["cell"] or article_no,
                    norm_kind=unit["norm_kind"], unit_index=unit["unit_index"],
                    source_sha256=source_sha, text_digest=fragment_sha,
                    span_start=unit["start"], span_end=unit["end"],
                    structural_path="/".join(structural_path),
                )
                deps = parse_dependencies(fragment, title_index=titles)
                unresolved = list(unit["open_conditions"])
                if unit["norm_kind"] in UNRESOLVED_KINDS:
                    unresolved.append("AUTO_DECOMPOSITION_UNRESOLVED")
                if not coverage["reconstruction_ok"]:
                    unresolved.append("SOURCE_RECONSTRUCTION_FAILED")
                weak = {
                    "pin_check_exists": law_id in hints,
                    "numeric_literal_in_text": bool(__import__("re").search(r"\d", fragment)),
                    "sufficient_for_completion": False,
                }
                units.append({
                    "norm_id": ident,
                    "task_id": ident,  # backward-compatible alias
                    "law_id": law_id,
                    "law_title": law.get("official_title", ""),
                    "revision": revision,
                    "history_id": history,
                    "enforcement_date": enforcement,
                    "source_file": source_file,
                    "source_sha256": source_sha,
                    "provision_kind": provision,
                    "structural_path": list(structural_path),
                    "article": article_no,
                    "article_title": article_title,
                    "paragraph": parts["paragraph"],
                    "item": parts["item"],
                    "subitem": parts["subitem"],
                    "table": parts["table"],
                    "cell": parts["cell"],
                    "norm_kind": unit["norm_kind"],
                    "markers": unit["markers"],
                    "norm_text": fragment[:400],
                    "norm_digest": fragment_sha,
                    "source_position": {
                        "path": "/".join(structural_path),
                        "char_start": unit["start"],
                        "char_end": unit["end"],
                        "exact_position_recorded": True,
                    },
                    "decomposition_coverage": coverage,
                    "dependencies": deps,
                    "reference_ids": sorted({d["value"] for d in deps
                                             if d["kind"] == "law_id_15"}),
                    "unresolved_conditions": unresolved,
                    "obligations": list(OBLIGATIONS),
                    "evidence_slots": {axis: None for axis in MECHANICAL_AXES},
                    "weak_hints": weak,
                    "legal_review": LEGAL_REVIEW_PENDING,
                    "scope": "NORM_UNIT",
                })

    assert_unique([u["norm_id"] for u in units])
    return units


def build() -> dict:
    units = build_units()
    state = load_state()
    evidence = load_evidence()
    state = merge_state(state, units)

    for unit in units:
        derived = derive_status(unit, state, evidence)
        recorded = state["units"][unit["norm_id"]]
        unit["verification"] = derived
        unit["status"] = derived["status"]
        unit["owner_agent"] = recorded["owner_agent"]
        unit["blockers"] = recorded["blockers"]
        unit["artifacts"] = recorded["artifacts"]
        unit["legal_review"] = recorded["legal_review"]

    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    payload = {
        "tool": "scripts/ci/task_queue.py",
        "schema": "normative-unit-queue-v1",
        "inventory_snapshot_date": inv.get("snapshot_date", ""),
        "laws_total": len(inv.get("laws", [])),
        "units_total": len(units),
        "status_vocabulary": list(STATUSES),
        "active_statuses": list(ACTIVE_STATUSES),
        "norm_kinds": list(NORM_KINDS),
        "obligations": list(OBLIGATIONS),
        "count_by_status": {s: sum(1 for u in units if u["status"] == s)
                            for s in STATUSES},
        "count_by_kind": {k: sum(1 for u in units if u["norm_kind"] == k)
                          for k in NORM_KINDS},
        "unresolved_units": sum(1 for u in units if u["unresolved_conditions"]),
        "coverage_gaps": sum(1 for u in units
                             if u["decomposition_coverage"]["coverage_gap_count"]),
        "completion": completion_claim(units, state, evidence),
        "legal_review_axis": LEGAL_REVIEW_PENDING,
        "completion_rule": ("status derives only from recorded evidence; numeric "
                            "matches, file existence and theorem names are weak hints"),
        "tasks": units,
    }
    return payload, state


def render_md(payload: dict) -> str:
    counts = payload["count_by_status"]
    lines = [
        "# Persistent normative-unit task queue (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.",
        "",
        "Directive §1: one durable work unit per decomposed norm unit. The",
        "identity binds law id, revision/history id, 本則/附則/別表, article,",
        "paragraph, item, subitem, appendix cell, norm kind, unit ordinal, exact",
        "source span, pinned source digest and text digest with a full SHA-256.",
        "A numeric match, file existence or theorem-name string is a weak hint",
        "only and can never produce a verification status.",
        "",
        f"- snapshot: {payload['inventory_snapshot_date']}",
        f"- laws in inventory: {payload['laws_total']}",
        f"- norm units generated: {payload['units_total']}",
        f"- unresolved units: {payload['unresolved_units']}",
        f"- decomposition coverage gaps: {payload['coverage_gaps']}",
        "",
        "## Verification status (evidence-derived, independent axes)",
        "",
        "| status | count |",
        "|---|---:|",
    ]
    for status in STATUSES:
        lines.append(f"| {status} | {counts[status]} |")
    lines += [
        "",
        "Human legal review is a SEPARATE axis (`LEGAL_REVIEW_PENDING`); it is",
        "never auto-satisfied and never folded into a verification status.",
        "",
        "## Norm-unit kinds",
        "",
        "| kind | count |",
        "|---|---:|",
    ]
    for kind in NORM_KINDS:
        lines.append(f"| {kind} | {payload['count_by_kind'][kind]} |")
    lines += [
        "",
        "## Persistence and completion semantics",
        "",
        "Owner, blockers, artifacts, attempts and review evidence are stored in",
        "the git-tracked `data/task_state.json` and merged on regeneration.",
        "`FULLY_VERIFIED` requires every mechanical evidence axis in",
        "`data/verification_evidence.json` and no unresolved condition. A bare",
        "15-digit id is only one dependency signal, never a complete analysis.",
        "",
        "## Sample unfinished units (first 20)",
        "",
        "| unit (short) | law_id | kind | article | norm type | unresolved | status |",
        "|---|---|---|---|---|---:|---|",
    ]
    unfinished = [u for u in payload["tasks"] if u["status"] in ACTIVE_STATUSES][:20]
    for unit in unfinished:
        lines.append(
            f"| `{unit['norm_id'][:16]}` | {unit['law_id']} | "
            f"{unit['provision_kind']} | {unit['article'][:20]} | "
            f"{unit['norm_kind']} | {len(unit['unresolved_conditions'])} | "
            f"{unit['status']} |"
        )
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    payload, state = build()
    QUEUE_JSON.parent.mkdir(parents=True, exist_ok=True)
    QUEUE_JSON.write_text(json.dumps(payload, ensure_ascii=False, separators=(",", ":")),
                          encoding="utf-8")
    text = render_md(payload)
    changed = False
    if not OUT_MD.exists() or OUT_MD.read_text(encoding="utf-8") != text:
        OUT_MD.parent.mkdir(parents=True, exist_ok=True)
        OUT_MD.write_text(text, encoding="utf-8")
        changed = True
    if "--persist" in sys.argv:
        save_state(state, STATE_PATH)
    print(f"normative-unit queue: {payload['units_total']} units across "
          f"{payload['laws_total']} laws; "
          + ", ".join(f"{k}={v}" for k, v in payload["count_by_status"].items()))
    return 0


if __name__ == "__main__":
    sys.exit(main())
