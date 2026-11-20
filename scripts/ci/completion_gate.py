#!/usr/bin/env python3
"""Completion reporting gate (Sponsor Directive §5).

Explicitly separates two questions:

  1. did the registered checks pass?   -> `registered_checks`: PASS/FAIL
  2. are ALL target obligations done?  -> `completion`: COMPLETE/INCOMPLETE

A SKIP is never counted as a PASS. This script never declares the corpus
complete merely because checks ran successfully; it reports measured counts
per state, per unit kind and per obligation. Exit status is 0 when the report
is produced, so it does not break existing green CI; the COMPLETE/INCOMPLETE
verdict is machine-readable in stdout for the coverage gate to consume.
"""
from __future__ import annotations

import json
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from normative_units import (  # noqa: E402
    DONE_STATES, EVIDENCE_KEYS, STATES, _valid_evidence, load_state,
)

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"


def main() -> int:
    if not QUEUE.exists():
        print("task queue missing; run scripts/ci/task_queue.py first")
        print("completion: INCOMPLETE (no queue)")
        return 0
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    state = load_state()
    tasks = q.get("tasks", [])
    states = Counter()
    kinds = Counter()
    evidence = Counter()
    blockers = 0
    human = 0
    for t in tasks:
        rec = state["tasks"].get(t["task_id"], {})
        states[rec.get("completion_state", "NOT_STARTED")] += 1
        kinds[t.get("unit", {}).get("kind", "UNRESOLVED")] += 1
        blockers += 1 if rec.get("blockers") else 0
        ev = rec.get("evidence") or {}
        for key in EVIDENCE_KEYS:
            if _valid_evidence(ev.get(key)):
                evidence[key] += 1
        review = rec.get("review") or {}
        if review.get("reviewer") and review.get("review_date"):
            human += 1
    done = sum(states.get(s, 0) for s in DONE_STATES)
    complete = bool(tasks) and done == len(tasks) and blockers == 0
    print(json.dumps({
        "tool": "scripts/ci/completion_gate.py",
        "registered_checks": "reported separately by scripts/ci/run_python_gates.py",
        "skip_is_pass": False,
        "needle_or_filename_never_completes": True,
        "units_total": len(tasks),
        "by_state": {s: states.get(s, 0) for s in STATES},
        "by_unit_kind": dict(sorted(kinds.items())),
        "by_obligation": {k: evidence.get(k, 0) for k in EVIDENCE_KEYS},
        "blocked_units": blockers,
        "human_legal_review": human,
        "completion": "COMPLETE" if complete else "INCOMPLETE",
    }, ensure_ascii=False, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
