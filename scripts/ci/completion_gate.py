#!/usr/bin/env python3
"""Completion gate (Objective §5) — two AXES, never merged.

Axis A: registered checks. Read from build/gate_results.json, written by
        run_python_gates.py. SKIP is reported as SKIP and never as PASS.
Axis B: all TECHNICAL obligations complete. Derived ONLY from the generated
        normative queue + durable evidence. A unit is technically complete at
        FULLY_VERIFIED with no open blocker and no unhandled condition. Human
        legal review is NOT part of this axis: sponsor directive 2026-11-24
        makes review a condition for a FINAL LEGAL DETERMINATION, not for
        starting or counting Lean formalization.

Axis C: independent human legal determination — reported separately and never
        satisfied by proof, attestation or mechanical source review.

The gate NEVER declares all-complete merely because registered checks passed.
It emits docs/COMPLETION_STATUS.md deterministically; exit 0 iff the emitted
text equals the committed file (regeneration gate), exit 1 after writing.
"""
from __future__ import annotations

import csv
import json
import re
import subprocess
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


def committed_queue_counts() -> dict | None:
    """Authoritative status counts from the COMMITTED task-queue document.

    build/task_queue.json is git-ignored and can be regenerated from a slightly
    different working tree; using it for the headline made published ledgers
    disagree by several units. Other regenerators (source_layers,
    directive_axes) already use the committed document.
    """
    doc = REPO / "docs" / "TASK_QUEUE.md"
    if not doc.exists():
        return None
    text = doc.read_text(encoding="utf-8")
    m = re.search(r"normative units:\s*(\d+)", text)
    counts = {}
    for state, value in re.findall(
            r"^\|\s*(NOT_STARTED|PARTIAL|PROVED_SCOPE|FULLY_VERIFIED|BLOCKED)\s*\|\s*(\d+)\s*\|",
            text, re.M):
        counts[state] = int(value)
    if not counts:
        return None
    counts["TOTAL"] = int(m.group(1)) if m else sum(counts.values())
    return counts


def _head_sha() -> str:
    try:
        out = subprocess.run(["git", "rev-parse", "HEAD"], capture_output=True,
                             text=True, check=False)
        return out.stdout.strip() if out.returncode == 0 else ""
    except (OSError, ValueError):
        return ""


def registered_checks() -> dict:
    r = _load(GATE_RESULTS)
    if not r:
        return {"available": False, "pass": 0, "fail": 0, "skip": 0,
                "required_skip": 0, "commit_matches_head": False,
                "results_sha": "", "head_sha": _head_sha(), "gates": []}
    gates = r.get("gates", [])
    verdicts = Counter(g.get("verdict", "UNKNOWN") for g in gates)
    required_skip = sum(1 for g in gates if g.get("required") and g.get("verdict") == "SKIP")
    head = _head_sha()
    results_sha = str(r.get("commit_sha", ""))
    return {
        "available": True,
        "pass": verdicts.get("PASS", 0),
        "fail": verdicts.get("FAIL", 0),
        "skip": verdicts.get("SKIP", 0),
        "required_skip": required_skip,
        "commit_matches_head": bool(head) and bool(results_sha) and head == results_sha,
        "results_sha": results_sha,
        "head_sha": head,
        "gates": gates,
    }


def checks_are_green(reg: dict) -> bool:
    """A green Axis A needs passing gates AND results bound to this commit."""
    return bool(reg.get("available") and reg.get("pass", 0) > 0
                and reg.get("fail", 0) == 0 and reg.get("skip", 0) == 0
                and reg.get("required_skip", 0) == 0
                and reg.get("commit_matches_head", False))


def human_review_count() -> tuple[int, int]:
    if not CANDIDATES.exists():
        return 0, 0
    with CANDIDATES.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    reviewed = sum(1 for row in rows if (row.get("reviewer") or "").strip())
    return reviewed, len(rows)


def build() -> str:
    q = _load(QUEUE) or {"units": []}
    # The normative-unit queue generator emits `units`; older rows used
    # `tasks`. Reading only the legacy key silently reported all zeros.
    tasks = q.get("units", q.get("tasks", []))
    live_counts = Counter(t.get("status", "NOT_STARTED") for t in tasks)
    committed_counts = committed_queue_counts()
    counts = Counter(committed_counts) if committed_counts else live_counts
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
    total = (committed_counts or {}).get("TOTAL", len(tasks))
    # Technical completion is independent of human review (directive §1).
    all_complete = bool(total) and complete_units == total and blockers == 0 \
        and unhandled == 0
    checks_ok = checks_are_green(reg)
    claim = all_complete and checks_ok
    legal_review_complete = bool(candidates) and reviews >= candidates
    legal_determination_complete = bool(claim and legal_review_complete)

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
        f"- gate results commit: {reg['results_sha'] or '(none)'}",
        f"- current HEAD commit: {reg['head_sha'] or '(unknown)'}",
        f"- results bound to this commit: {reg['commit_matches_head']}",
        f"- registered checks all green: {checks_ok}",
        "",
        "## Axis B — all TECHNICAL obligations complete (human review excluded)",
        "",
        f"- normative units: {total}",
    ]
    for state in STATES:
        lines.append(f"- {state}: {counts.get(state, 0)}")
    lines += [
        f"- units with an open blocker: {blockers}",
        f"- units with unhandled conditions: {unhandled}",
        "",
        "## Axis C — independent human legal determination (separate, not a gate)",
        "",
        f"- human legal reviews recorded: {reviews}/{candidates} candidates",
        f"- legal review pending: {not legal_review_complete}",
        f"- legal determination complete (requires Axis B AND recorded review): "
        f"{legal_determination_complete}",
        "- pending review never stops formalization, proof or source audit",
        "- no reviewer or approval field may be fabricated by automation",
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
        f"- technical all-complete claimable (still not a legal determination): {claim}",
        f"- final legal determination claimable: {legal_determination_complete}",
        "",
        "An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,",
        "any open blocker or any unhandled condition keeps the TECHNICAL",
        "all-complete claim FALSE. Pending human review keeps the legal",
        "determination unconfirmed but does not stop formalization. No claim of",
        "legal correctness is made.",
        "",
    ]
    return "\n".join(lines)


def _stable_text(text: str) -> str:
    """Mask per-commit provenance values before the determinism comparison.

    The SHA lines are evidence, not configuration: their values legitimately
    change with every commit. Comparing them verbatim made the regeneration
    gate fail on every commit after the provenance fields were introduced.
    """
    pattern = re.compile(r"^(- (?:gate results commit|current HEAD commit): ).*$")
    return "\n".join(pattern.sub(r"\1(variable)", line) for line in text.splitlines())


def main() -> int:
    text = build()
    OUT.parent.mkdir(parents=True, exist_ok=True)
    if OUT.exists() and _stable_text(OUT.read_text(encoding="utf-8")) == _stable_text(text):
        print("completion gate status matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
