#!/usr/bin/env python3
"""Deterministic Coordinator for the continuing formalization loop (§3).

The Coordinator does not decide completion and does not perform legal review.
It INSPECTs the persistent queue, SELECTs dependency-ready unclaimed units,
and ASSIGNs each unit to three SEPARATE High4 roles (formalize / prove /
independent review). Claims are durable so two agents never edit the same
artifact and a stopped task cannot stop the rest of the queue.

Loop: INSPECT -> SELECT -> FORMALIZE -> PROVE -> CHALLENGE -> VERIFY -> COMMIT
      -> REPEAT

Usage:
  python scripts/ci/coordinator.py inspect
  python scripts/ci/coordinator.py select [N]
  python scripts/ci/coordinator.py assign [N] [--write]
  python scripts/ci/coordinator.py release <claim_id>
  python scripts/ci/coordinator.py cycle [N] [--write]

`--write` persists the claim ledger. Without it the command is a dry run.
"""
from __future__ import annotations

import argparse
import json
import sys
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import normative_core as core  # noqa: E402
import task_selector as selector  # noqa: E402

QUEUE = REPO / "build" / "task_queue.json"
CLAIMS = REPO / "data" / "COORDINATOR_CLAIMS.json"

PHASES = ["INSPECT", "SELECT", "FORMALIZE", "PROVE", "CHALLENGE",
          "VERIFY", "COMMIT", "REPEAT"]

# Three independent roles. A single agent never covers more than one role for a
# given unit: the prover must not trust the formalizer's misunderstanding, and
# the independent reviewer must not trust either.
ROLES = (
    ("FORMALIZER", "model the scoped normative content + independent spec"),
    ("PROVER", "kernel-check spec/impl agreement and boundary cases"),
    ("INDEPENDENT_REVIEWER", "re-extract the pinned 原文 and challenge scope"),
)


def load_claims(path: Path = CLAIMS) -> dict:
    """Load the durable claim ledger; a missing ledger is an empty ledger."""
    if not path.exists():
        return {"schema": "coordinator-claims/v1", "claims": {}}
    data = json.loads(path.read_text(encoding="utf-8"))
    data.setdefault("schema", "coordinator-claims/v1")
    data.setdefault("claims", {})
    return data


def save_claims(data: dict, path: Path = CLAIMS) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    path.write_text(payload, encoding="utf-8")


def claim_ids_for(data: dict, task_id: str) -> list[str]:
    return [cid for cid, c in data["claims"].items()
            if c.get("task_id") == task_id and c.get("active", True)]


def owners_for(data: dict) -> dict[str, str]:
    """Map a task id to the first active claim owner, for the selector."""
    out: dict[str, str] = {}
    for claim in data["claims"].values():
        if claim.get("active", True) and claim.get("task_id"):
            out.setdefault(claim["task_id"], claim["owner"])
    return out


def load_tasks() -> list[dict]:
    if not QUEUE.exists():
        return []
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    return q.get("tasks", [])


def inspect(tasks: list[dict], claims: dict) -> dict:
    counts: dict[str, int] = {}
    for t in tasks:
        s = str(t.get("status", core.STATUS_NOT_STARTED))
        counts[s] = counts.get(s, 0) + 1
    active = sum(1 for c in claims["claims"].values() if c.get("active", True))
    return {
        "phase": "INSPECT",
        "phases": PHASES,
        "queue_units": len(tasks),
        "status_counts": counts,
        "active_claims": active,
        "legal_review_axis": "LEGAL_REVIEW_PENDING (never auto-satisfied)",
        "completion_is_not_declared": True,
    }


def select(tasks: list[dict], claims: dict, n: int) -> dict:
    """Dependency-ready, unclaimed units. Human review is never a filter."""
    result = selector.select_tasks(tasks, n, owners_for(claims))
    return {
        "phase": "SELECT",
        "selected_count": len(result["selected"]),
        "blocked_count": len(result.get("blocked", [])),
        "selectable": result["selectable"],
        "units": result["selected"],
        "legal_review_is_not_a_filter": True,
    }


def assign(tasks: list[dict], claims: dict, n: int, write: bool = False,
           path: Path = CLAIMS) -> dict:
    """Assign each selected unit to three independent High4 roles."""
    picked = select(tasks, claims, n)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    assignments = []
    for unit in picked["units"]:
        tid = unit["task_id"]
        for role, duty in ROLES:
            cid = f"{stamp}|{tid}|{role}"
            entry = {
                "claim_id": cid,
                "task_id": tid,
                "law_id": unit.get("law_id", ""),
                "article": unit.get("article", ""),
                "role": role,
                "duty": duty,
                "owner": f"High4-{role}",
                "phase": PHASES[2 + [r for r, _ in ROLES].index(role)],
                "status": "ASSIGNED",
                "active": True,
                "legal_review": core.LEGAL_REVIEW_PENDING,
                "claimed_at": stamp,
            }
            assignments.append(entry)
            if write:
                claims["claims"][cid] = entry
    if write:
        save_claims(claims, path)
    return {
        "phase": "ASSIGN",
        "dry_run": not write,
        "assignments": assignments,
        "assignment_count": len(assignments),
        "distinct_roles_per_unit": len(ROLES),
        "legal_review": core.LEGAL_REVIEW_PENDING,
    }


def release(claim_id: str, claims: dict, write: bool = False,
            path: Path = CLAIMS) -> dict:
    entry = claims["claims"].get(claim_id)
    if entry is None:
        return {"phase": "RELEASE", "released": False, "claim_id": claim_id}
    if write:
        claims["claims"][claim_id]["active"] = False
        claims["claims"][claim_id]["status"] = "RELEASED"
        save_claims(claims, path)
    return {"phase": "RELEASE", "released": True, "dry_run": not write,
            "claim_id": claim_id}


def cycle(tasks: list[dict], claims: dict, n: int, write: bool = False,
          path: Path = CLAIMS) -> dict:
    before = inspect(tasks, claims)
    assigned = assign(tasks, claims, n, write=write, path=path)
    after = inspect(tasks, load_claims(path) if write else claims)
    return {
        "phase": "REPEAT",
        "cycle": {
            "inspect": before,
            "assign": assigned,
            "after": after,
            "measurable_progress": {
                "units_selected": assigned["assignment_count"] // len(ROLES),
                "new_active_claims": after["active_claims"] - before["active_claims"],
                "status_changed_by_coordinator": False,
            },
        },
        "note": "Formalize/prove/review are executed by separate High4 agents; "
                "claims only prevent conflicting edits.",
    }


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("command", choices=("inspect", "select", "assign",
                                        "release", "cycle"))
    p.add_argument("n_or_claim", nargs="?", default=None)
    p.add_argument("--write", action="store_true")
    args = p.parse_args()
    claims = load_claims()
    if args.command == "release":
        if not args.n_or_claim:
            print("release requires a claim_id", file=sys.stderr)
            return 2
        payload = release(args.n_or_claim, claims, write=args.write)
    else:
        n = int(args.n_or_claim or 12)
        tasks = load_tasks()
        if args.command == "inspect":
            payload = inspect(tasks, claims)
        elif args.command == "select":
            payload = select(tasks, claims, n)
        elif args.command == "assign":
            payload = assign(tasks, claims, n, write=args.write)
        else:
            payload = cycle(tasks, claims, n, write=args.write)
    out = json.dumps(payload, ensure_ascii=False, indent=2)
    try:
        sys.stdout.reconfigure(encoding="utf-8")
    except (AttributeError, ValueError):
        pass
    print(out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
