#!/usr/bin/env python3
"""Per-normative-unit verification obligations (Sponsor Directive §1/§4/§5).

Replaces the article-level "needle + 3 files + agree* string" completion test.
For EVERY normative unit in the persistent queue this ledger records:

  * the exact original-text locator and source sha256;
  * an independent formal specification artifact (hash) distinct from the
    implementation artifact (hash);
  * the implementation artifact (hash);
  * proof obligations with a kernel-checked result artifact (no sorry/admit/
    unexplained axioms) -- theorem-name strings are NOT evidence;
  * boundary/edge-case tests with recorded names and pass counts;
  * unhandled conditions (must be empty or dispositioned);
  * independent adversarial-audit trail with a distinct auditor;
  * human legal-review trail, tracked on a SEPARATE axis.

A unit is machine-COMPLETE only when all machine obligations are satisfied AND
the persistent state ledger already records a terminal state derived from that
evidence. Human legal review is reported on a separate axis and is NOT a
prerequisite. Needle matches, file existence and theorem-name matches can never
complete a unit here.

Regenerate with `python scripts/ci/article_obligations.py`; deterministic gate.
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
OUT = REPO / "docs" / "ARTICLE_OBLIGATIONS.md"


def _ev(state_rec, key):
    value = (state_rec.get("evidence") or {}).get(key)
    return value if _valid_evidence(value) else None


def obligations_for(task, state_rec):
    ev = state_rec.get("evidence") or {}
    spec = _ev(state_rec, "independent_spec")
    impl = _ev(state_rec, "implementation")
    proof = _ev(state_rec, "proof_result")
    tests = _ev(state_rec, "boundary_tests")
    audit = task.get("decomposition", {}).get("audit", {})
    source_ok = bool(task.get("source_file")) and bool(task.get("source_sha256"))
    unhandled = (state_rec.get("unhandled_conditions") or [])
    dispositions = (state_rec.get("unhandled_dispositions") or {})
    independent = _ev(state_rec, "independent_audit")
    reviewer = (state_rec.get("review") or {}).get("reviewer", "")
    review_date = (state_rec.get("review") or {}).get("review_date", "")

    rows = {
        "source_pin": (source_ok and bool(_ev(state_rec, "source_pin")),
                       "pinned source hash + source evidence artifact"),
        "decomposition_audit": (
            audit.get("decomposition_ok") is True and bool(_ev(state_rec, "decomposition_audit")),
            "independent coverage audit, zero unresolved/gap/overlap characters",
        ),
        "independent_spec": (
            bool(spec) and bool(impl) and spec.get("sha256") != impl.get("sha256")
            and bool(spec.get("author")),
            "spec hash distinct from implementation hash, with author recorded",
        ),
        "implementation": (bool(impl), "implementation artifact hash"),
        "proof_result": (
            bool(proof) and proof.get("kind") == "proof_result"
            and bool(proof.get("kernel_checked"))
            and not any(proof.get(k) for k in
                        ("sorry_count", "admit_count", "unexpected_axiom_count")),
            "kernel-checked proof result, zero sorry/admit/unexpected axioms",
        ),
        "boundary_tests": (
            bool(tests) and int(tests.get("passed", 0)) > 0 and bool(tests.get("test_names")),
            "named boundary tests with pass count",
        ),
        "unhandled_conditions": (
            not unhandled or all(dispositions.get(str(x)) for x in unhandled),
            "no unhandled conditions, or every one dispositioned",
        ),
        "independent_audit": (
            bool(independent)
            and bool(independent.get("auditor"))
            and independent.get("auditor") != (impl or {}).get("author"),
            "adversarial audit by an agent distinct from the implementer",
        ),
    }
    # Human legal review is tracked but NOT required for machine completion.
    rows["review_trail_SEPARATE_AXIS"] = (
        bool(reviewer) and bool(review_date),
        "human legal reviewer and review date recorded (separate axis)",
    )
    all_ok = all(rows[k][0] for k in EVIDENCE_KEYS)
    terminal = state_rec.get("completion_state") in DONE_STATES
    blocked = bool(state_rec.get("blockers"))
    complete = all_ok and terminal and not blocked
    return rows, complete, {"reviewer": reviewer, "review_date": review_date}


def main() -> int:
    if not QUEUE.exists():
        print("task queue missing; run scripts/ci/task_queue.py first", file=sys.stderr)
        return 1
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    state = load_state()
    tasks = q.get("tasks", [])
    rows = []
    counts = Counter()
    states = Counter()
    human_reviewed = 0

    for t in tasks:
        rec = state["tasks"].get(t["task_id"], {})
        obligations, complete, review = obligations_for(t, rec)
        state_name = rec.get("completion_state", t.get("status", {}).get("completion_state", "NOT_STARTED"))
        states[state_name] += 1
        if complete:
            counts["COMPLETE"] += 1
        else:
            counts["INCOMPLETE"] += 1
        if review["reviewer"] and review["review_date"]:
            human_reviewed += 1
        marks = "|".join("✓" if obligations[k][0] else "✗" for k in EVIDENCE_KEYS)
        rows.append(
            f"| `{t.get('normative_ref', t['task_id'])[:44]}` | "
            f"{t['unit']['locator'].split('@')[0]} | {t['unit']['kind']} | "
            f"{state_name} | {marks} | {'COMPLETE' if complete else 'INCOMPLETE'} |"
        )

    header = "|".join(EVIDENCE_KEYS)
    lines = [
        "# Normative-unit verification obligations (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/article_obligations.py`.",
        "",
        "Completion is evidence-driven, per NORMATIVE UNIT. A pinned needle, a",
        "file's existence, or a theorem-name string match can never make a row",
        "COMPLETE. `review_trail` is a separate human axis; a unit can be",
        "mechanically complete while legal review is still pending.",
        "",
        "## Totals",
        "",
        f"- normative units: {len(tasks)}",
        f"- COMPLETE (all obligations + terminal state): {counts.get('COMPLETE', 0)}",
        f"- INCOMPLETE: {counts.get('INCOMPLETE', 0)}",
        f"- human legal review recorded: {human_reviewed}/{len(tasks)} (separate axis)",
        "",
        "| state | units |",
        "|---|---:|",
        *[f"| {s} | {states.get(s, 0)} |" for s in STATES],
        "",
        "## Per-unit status",
        "",
        f"| unit | provision | kind | state | {header} | result |",
        "|---|---|---|---|" + "---:|" * len(EVIDENCE_KEYS) + "---|",
        *rows,
        "",
    ]
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(
        f"article obligations: {counts.get('COMPLETE', 0)} COMPLETE / "
        f"{counts.get('INCOMPLETE', 0)} INCOMPLETE across {len(tasks)} units"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
