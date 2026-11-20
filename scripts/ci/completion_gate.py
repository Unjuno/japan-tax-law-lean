#!/usr/bin/env python3
"""Completion gate (Objective §5) — two AXES, never merged.

Axis A: registered checks. Read from build/gate_results.json, written by
        run_python_gates.py. SKIP is reported as SKIP and never as PASS.
Axis B: all obligations complete. Derived ONLY from the generated normative
        queue + durable evidence. A unit is complete only at FULLY_VERIFIED
        with no open blocker, no unhandled condition and a recorded human
        legal review; the all-complete claim additionally requires every unit
        to be complete.

The gate NEVER declares all-complete merely because registered checks passed.
It emits docs/COMPLETION_STATUS.md deterministically; exit 0 iff the emitted
text equals the committed file (regeneration gate), exit 1 after writing.
"""
from __future__ import annotations

import csv
import json
import sys
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
GATE_RESULTS = REPO / "build" / "gate_results.json"
CANDIDATES = REPO / "docs" / "L7_CANDIDATES_UNREVIEWED.csv"
OUT = REPO / "docs" / "COMPLETION_STATUS.md"

STATES = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED")


def _load(path: Path):
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else None


def registered_checks() -> dict:
    r = _load(GATE_RESULTS)
    if not r:
        return {"available": False, "pass": 0, "fail": 0, "skip": 0,
                "required_skip": 0, "gates": []}
    gates = r.get("gates", [])
    verdicts = Counter(g.get("verdict", "UNKNOWN") for g in gates)
    required_skip = sum(1 for g in gates if g.get("required") and g.get("verdict") == "SKIP")
    return {
        "available": True,
        "pass": verdicts.get("PASS", 0),
        "fail": verdicts.get("FAIL", 0),
        "skip": verdicts.get("SKIP", 0),
        "required_skip": required_skip,
        "gates": gates,
    }


def human_review_count() -> tuple[int, int]:
    if not CANDIDATES.exists():
        return 0, 0
    with CANDIDATES.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    reviewed = sum(1 for row in rows if (row.get("reviewer") or "").strip())
    return reviewed, len(rows)


def build() -> str:
    q = _load(QUEUE) or {"tasks": []}
    tasks = q.get("tasks", [])
    counts = Counter(t.get("status", "NOT_STARTED") for t in tasks)
    evidence_ledger = _load(REPO / "data" / "verification_evidence.json") or {}
    evidence_by_id = evidence_ledger.get("units", {})
    axes = Counter()
    layers = Counter()
    for t in tasks:
        uid = t.get("normative_id") or t.get("unit_id") or t.get("id")
        ev = t.get("evidence") or evidence_by_id.get(uid, {}) or {}
        for axis, value in ev.items():
            # Evidence values are reproducible REFERENCES (non-empty strings),
            # not booleans. Counting only `value is True` silently emptied the
            # table even when every unit was evidence-backed.
            if value is True or (isinstance(value, str) and value.strip()):
                axes[axis] += 1
        coverage = t.get("coverage") or {}
        if t.get("source_file") and t.get("source_sha256"):
            layers["acquired"] += 1
        if coverage.get("exact") and coverage.get("unique_ids"):
            layers["decomposed"] += 1
        if any(ev.get(k) for k in ("independent_spec", "implementation", "tests")):
            layers["partially_formalized"] += 1
        if ev.get("kernel_proof"):
            layers["kernel_proved"] += 1
        if ev.get("source_correspondence_audit"):
            layers["source_audited"] += 1
        legal = t.get("legal_review", "")
        if not legal:
            state = (evidence_by_id.get(uid) or {}).get("legal_review", "")
            legal = state if isinstance(state, str) else ""
        if legal and legal != "LEGAL_REVIEW_PENDING":
            layers["human_reviewed"] += 1
    blockers = sum(1 for t in tasks if t.get("blockers"))
    unhandled = sum(1 for t in tasks if t.get("unhandled_conditions"))
    reviews, candidates = human_review_count()
    reg = registered_checks()

    complete_units = counts.get("FULLY_VERIFIED", 0)
    total = len(tasks)
    all_complete = bool(total) and complete_units == total and blockers == 0 \
        and unhandled == 0 and reviews >= candidates and candidates > 0
    checks_ok = reg["available"] and reg["fail"] == 0 and reg["skip"] == 0 \
        and reg["required_skip"] == 0 and reg["pass"] > 0
    claim = all_complete and checks_ok

    lines = [
        "# Completion status (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.",
        "",
        "Two independent axes. Registered checks passing is NOT the same as all",
        "obligations being complete. SKIP is never counted as PASS.",
        "",
        "## Axis A — registered checks (last recorded gate run)",
        "",
        f"- results file available: {reg['available']}",
        f"- PASS: {reg['pass']}",
        f"- FAIL: {reg['fail']}",
        f"- SKIP: {reg['skip']}",
        f"- required gates SKIPped: {reg['required_skip']}",
        f"- registered checks all green: {checks_ok}",
        "",
        "## Axis B — all registered obligations complete",
        "",
        f"- normative units: {total}",
    ]
    for state in STATES:
        lines.append(f"- {state}: {counts.get(state, 0)}")
    lines += [
        f"- units with an open blocker: {blockers}",
        f"- units with unhandled conditions: {unhandled}",
        f"- human legal reviews recorded: {reviews}/{candidates} candidates",
        "",
        "## Objective §5 coverage layers (separate denominators, never combined)",
        "",
        "| layer | units | denominator |",
        "|---|---:|---:|",
        f"| all targets (generated normative units) | {total} | {total} |",
        f"| acquired (pinned source file + SHA-256) | {layers['acquired']} | {total} |",
        f"| decomposed (exact reconstruction + unique ids) | {layers['decomposed']} | {total} |",
        f"| partially formalized (spec / impl / tests evidence) | {layers['partially_formalized']} | {total} |",
        f"| kernel proved (CI-attested proof evidence) | {layers['kernel_proved']} | {total} |",
        f"| source-audited (原文 correspondence evidence) | {layers['source_audited']} | {total} |",
        f"| human reviewed (legal-review axis recorded) | {layers['human_reviewed']} | {total} |",
        "",
        "## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)",
        "",
        "| axis | units |",
        "|---|---:|",
    ]
    for axis in sorted(axes):
        lines.append(f"| {axis} | {axes[axis]} |")
    lines += [
        "",
        "## Verdict",
        "",
        f"- all normative units decomposed, formalized, proved and source-audited: {all_complete}",
        f"- all-complete claimable: {claim}",
        "",
        "An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,",
        "any open blocker, any unhandled condition or any pending human review",
        "keeps the all-complete claim FALSE. No claim of legal correctness is made.",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    text = build()
    OUT.parent.mkdir(parents=True, exist_ok=True)
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("completion gate status matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
