#!/usr/bin/env python3
"""Persistent Coordinator for the Sponsor Directive §3 execution loop.

INSPECT -> SELECT -> FORMALIZE -> PROVE -> CHALLENGE -> VERIFY -> COMMIT -> REPEAT

The Coordinator is deliberately DETERMINISTIC and clock-free. It reads the
generated normative-unit projection and the durable state ledger, selects
unfinished dependency-ready work, and emits one assignment packet per unit to
a distinct role (formalizer / prover / independent challenger). It never edits a
Lean file and never completes a unit: only recorded, independently reproducible
evidence can do that.

Invariants enforced here:

* Human legal review is NOT a selection filter and NOT a completion gate. It is
  reported as a separate LEGAL_REVIEW_PENDING axis on every assignment.
* A unit is assigned to at most one role at a time; claims/owners prevent two
  agents from editing the same artifact in parallel.
* A blocked unit is reported, never allowed to stop the rest of the queue.
* Dependencies are resolved by law + article + enforced revision (delegated to
  scripts/ci/task_selector.py and normative_core), never by a bare law id.

Usage:
  python scripts/ci/coordinator.py --once --n 12
  python scripts/ci/coordinator.py --once --n 12 --claims build/coordinator_claims.json
"""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import normative_core as core  # noqa: E402
import task_selector as selector  # noqa: E402

REPO = HERE.parents[1]
QUEUE = REPO / "build" / "task_queue.json"
STATE = REPO / "data" / "task_state.json"
ASSIGNMENTS = REPO / "build" / "coordinator_assignments.json"
OUT_JSON = REPO / "data" / "COORDINATOR_STATE.json"
OUT_MD = REPO / "docs" / "COORDINATOR_STATE.md"

LOOP = ("INSPECT", "SELECT", "FORMALIZE", "PROVE", "CHALLENGE", "VERIFY",
        "COMMIT", "REPEAT")
ROLES = ("FORMALIZE", "PROVE", "CHALLENGE", "VERIFY")
AXES = core.EVIDENCE_AXES

ROLE_CHECKLISTS = {
    "FORMALIZE": [
        "write an independent spec FIRST (own spec* definitions, no implementation ids)",
        "implement the pinned clause as a separate Lean module",
        "record pinned law id / revision / scoped article and exact needle in both headers",
        "do NOT mark legal review: it stays LEGAL_REVIEW_PENDING",
    ],
    "PROVE": [
        "bridge implementation to the independent spec with kernel-checked proofs only",
        "add kernel-decided boundary tests (zero, small, threshold-1, threshold, threshold+1, saturation)",
        "no sorry / admit / unexplained axioms",
    ],
    "CHALLENGE": [
        "re-extract the needle independently from the pinned article/cell, not the whole text",
        "record H/T/D/C/U in a module-specific adversarial review file",
        "check conditions, exceptions, rounding, periods and enforcement date separately",
        "this is a mechanical review, never a human legal approval",
    ],
    "VERIFY": [
        "require Lean kernel build success and a CI-backed hash attestation",
        "regenerate evidence and queue; accept only an evidence-derived status advance",
        "record measurable delta in the ledger; never claim whole-law completion",
    ],
}


def _load(path: Path, default):
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else default


def role_for(task: dict, evidence: dict) -> str:
    """Assign the next unfinished role. Most advanced missing axis decides."""
    ev = evidence or {}

    def has(k: str) -> bool:
        v = ev.get(k)
        return isinstance(v, str) and bool(v.strip()) and not v.strip().startswith("__")

    if not (has("source_location") and has("independent_spec") and has("implementation")):
        return "FORMALIZE"
    if not (has("kernel_proof") and has("proof_scope") and has("tests")):
        return "PROVE"
    if not (has("source_correspondence_audit") and has("adversarial_review")):
        return "CHALLENGE"
    if not (has("boundary_proof") and has("cross_law_proof") and has("decomposition_audit")):
        return "CHALLENGE"
    return "VERIFY"


def inspect(tasks: list[dict]) -> dict:
    counts = {}
    for t in tasks:
        s = str(t.get("status", core.STATUS_NOT_STARTED))
        counts[s] = counts.get(s, 0) + 1
    return {
        "stage": "INSPECT",
        "queue_units": len(tasks),
        "status_counts": counts,
        "legal_review_axis": "LEGAL_REVIEW_PENDING (separate axis; not a gate)",
        "skipped_because_blocker": sum(
            1 for t in tasks if any(not b.get("resolved", False)
                                    for b in t.get("blockers", []))),
    }


def run_once(tasks: list[dict], n: int, claims: dict | None = None) -> dict:
    """Pure selection/assignment policy; callers perform the actual work."""
    claims = claims or {}
    state = _load(STATE, {"units": {}}).get("units", {})
    selected = selector.select_tasks(tasks, n, claims)
    assignments = []
    for item in selected["selected"]:
        uid = item["normative_id"]
        ev = state.get(uid, {}).get("evidence", {})
        remaining = [a for a in AXES if not ev.get(a)]
        role = role_for(item, ev)
        assignments.append({
            "normative_id": uid,
            "law_id": item.get("law_id", ""),
            "article": item.get("article", ""),
            "revision": item.get("revision", ""),
            "enforcement_date": item.get("enforcement_date", ""),
            "role": role,
            "status": item.get("status", ""),
            "remaining_axes": remaining,
            "dependencies": item.get("dependencies", []),
            "unhandled_conditions": item.get("unhandled_conditions", []),
            "legal_review": core.LEGAL_REVIEW_PENDING,
            "scope": item.get("scope", "COMPUTABLE_SLICE_ONLY"),
            "checklist": ROLE_CHECKLISTS[role],
            "claim_owner": claims.get(uid, ""),
        })
    by_role = {r: [a["normative_id"] for a in assignments if a["role"] == r]
               for r in ROLES}
    stages = [
        {"stage": "INSPECT", "status_counts": inspect(tasks)["status_counts"]},
        {"stage": "SELECT", "selected": len(assignments),
         "selectable": selected["selectable"],
         "skipped_dependency_or_blocker": selected["skipped_dependency_or_blocker"]},
        {"stage": "FORMALIZE/PROVE/CHALLENGE/VERIFY",
         "assignments_by_role": by_role},
        {"stage": "COMMIT", "action": (
            "worker commits evidence-backed artifacts; Coordinator never self-certifies")},
        {"stage": "REPEAT", "action": "re-run after each evidence-backed commit"},
    ]
    return {
        "tool": "scripts/ci/coordinator.py",
        "schema": "coordinator/v1",
        "loop": list(LOOP),
        "roles": list(ROLES),
        "legal_review_is_not_a_filter": True,
        "legal_review_is_not_a_completion_gate": True,
        "one_blocked_unit_does_not_stop_others": True,
        "stages": stages,
        "assignments": assignments,
        "blocked": selected["blocked"][:50],
        "blocked_total": len(selected["blocked"]),
        "assignment_packet": str(ASSIGNMENTS.relative_to(REPO)),
    }


def render(data: dict) -> str:
    counts = data["stages"][0]["status_counts"]
    by_role = data["stages"][2]["assignments_by_role"]
    lines = [
        "# Coordinator state (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/coordinator.py`.",
        "",
        "Loop: " + " -> ".join(data["loop"]),
        "",
        f"- queue units: {sum(counts.values())}",
        "- statuses: " + ", ".join(f"{k}={v}" for k, v in sorted(counts.items())),
        f"- selected this iteration: {data['stages'][1]['selected']}",
        f"- blocked by dependency/blocker: {data['blocked_total']} "
        "(reported, not stopping the queue)",
        "- human legal review: LEGAL_REVIEW_PENDING, separate axis; never a filter "
        "or a formalization gate",
        "",
        "| role | assigned unit ids |",
        "|---|---|",
    ]
    for role in ROLES:
        ids = by_role[role]
        lines.append(f"| {role} | {', '.join(x[:24] for x in ids[:5]) or '—'}"
                     + (f" (+{len(ids) - 5})" if len(ids) > 5 else "") + " |")
    lines += [
        "",
        "Role separation: the formalizer writes spec + implementation, the prover "
        "writes kernel bridges/tests, and the challenger writes an independent "
        "module-specific H/T/D/C/U review. One unit is assigned to one role at a "
        "time; claims prevent parallel edits of the same artifact.",
        "",
        "Machine-readable assignment packets: `build/coordinator_assignments.json`.",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--once", action="store_true", help="run one INSPECT..COMMIT iteration")
    ap.add_argument("--check", action="store_true",
                    help="regeneration gate: fail if committed state drifted")
    ap.add_argument("--n", type=int, default=12)
    ap.add_argument("--claims", default="")
    args = ap.parse_args()
    if not args.once and not args.check:
        print("use --once to run one coordinator iteration, or --check for drift")
        return 2
    tasks = _load(QUEUE, {"tasks": []}).get("tasks", [])
    # A committed state file must never depend on an uncommitted claims file.
    claims = _load(Path(args.claims), {}) if (args.claims and args.once) else {}
    data = run_once(tasks, args.n, claims)
    if args.check:
        blob = json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
        md = render(data)
        if (OUT_JSON.exists() and OUT_MD.exists()
                and OUT_JSON.read_text(encoding="utf-8") == blob
                and OUT_MD.read_text(encoding="utf-8") == md):
            print("coordinator state matches committed state (deterministic)")
            return 0
        print("coordinator state DRIFTED; regenerate with --once")
        return 1
    ASSIGNMENTS.parent.mkdir(parents=True, exist_ok=True)
    ASSIGNMENTS.write_text(json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                           encoding="utf-8")
    OUT_JSON.write_text(json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                        encoding="utf-8")
    OUT_MD.write_text(render(data), encoding="utf-8")
    print(json.dumps({
        "queue_units": len(tasks),
        "selected": len(data["assignments"]),
        "by_role": {r: len(v) for r, v in data["stages"][2]["assignments_by_role"].items()},
        "blocked_total": data["blocked_total"],
        "packet": data["assignment_packet"],
    }, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    sys.exit(main())
