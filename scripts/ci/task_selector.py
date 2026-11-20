#!/usr/bin/env python3
"""Coordinator task selector (Directive §1 / §4).

Selection rules:
  1. Only unfinished units are selectable; BLOCKED units need --include-blocked.
  2. Dependency readiness is computed by the shared core (law names, articles,
     versions and 15-digit ids). Unresolvable dependencies are reported, never
     silently treated as satisfied.
  3. Ownership is honoured and persisted in the durable state file so it
     survives regeneration and session restart (§1.7).
  4. Human legal review is NOT a selection filter.

Usage: python scripts/ci/task_selector.py [n] [--owner NAME] [--reassign]
                                          [--include-blocked]
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

from normative_core import (
    ACTIVE_STATUSES, BLOCKED, QUEUE_JSON, STATE_PATH, load_state, now,
    dependency_readiness, save_state,
)


def computable(unit: dict) -> int:
    text = unit.get("norm_text", "") or ""
    return sum(1 for key in ("円", "百分", "割合", "税率", "控除", "千分", "乗じ", "除し")
               if key in text)


def select(tasks: list[dict], n: int = 12, *, owner: str | None = None,
           reassign: bool = False, include_blocked: bool = False) -> list[dict]:
    """Return the highest-priority selectable units with dependency reports."""
    completed = {t["norm_id"] for t in tasks
                 if t.get("status") in ("PROVED_SCOPE", "FULLY_VERIFIED")}
    candidates = []
    for task in tasks:
        status = task.get("status")
        if status == BLOCKED and not include_blocked:
            continue
        if status not in ACTIVE_STATUSES and not (status == BLOCKED and include_blocked):
            continue
        current_owner = task.get("owner_agent") or ""
        if current_owner and current_owner != owner and not reassign:
            continue
        readiness = dependency_readiness(task.get("dependencies", []), completed)
        candidates.append((task, readiness))

    candidates.sort(key=lambda pair: (
        -len(pair[1]["unresolved"]),
        -computable(pair[0]),
        len(pair[0].get("dependencies", [])),
        pair[0].get("law_id", ""),
        pair[0].get("article", ""),
    ))
    selected = []
    for task, readiness in candidates[:n]:
        row = dict(task)
        row["dependency_report"] = readiness
        row["selected_for"] = owner or ""
        selected.append(row)
    return selected


def main() -> int:
    args = sys.argv[1:]
    owner = None
    reassign = "--reassign" in args
    include_blocked = "--include-blocked" in args
    positional = []
    i = 0
    while i < len(args):
        arg = args[i]
        if arg == "--owner" and i + 1 < len(args):
            owner = args[i + 1]
            i += 2
            continue
        if not arg.startswith("--"):
            positional.append(arg)
        i += 1
    n = int(positional[0]) if positional else 12

    queue = json.loads(QUEUE_JSON.read_text(encoding="utf-8")) if QUEUE_JSON.exists() else {"tasks": []}
    tasks = queue.get("tasks", [])
    selected = select(tasks, n, owner=owner, reassign=reassign,
                      include_blocked=include_blocked)

    if owner:
        state = load_state(STATE_PATH)
        for row in selected:
            entry = state["units"].get(row["norm_id"])
            if entry is None:
                continue
            entry["owner_agent"] = owner
            entry["updated_at"] = now()
        save_state(state, STATE_PATH)

    out = {
        "tool": "scripts/ci/task_selector.py",
        "schema": "task-selector-v1",
        "queue_units": len(tasks),
        "selected_count": len(selected),
        "owner": owner,
        "dependency_policy": "unresolved dependencies reported, never assumed satisfied",
        "legal_review_is_filter": False,
        "selected": [
            {
                "norm_id": r["norm_id"],
                "law_id": r["law_id"],
                "article": r.get("article", ""),
                "norm_kind": r.get("norm_kind", ""),
                "norm_fragment": r.get("norm_text", ""),
                "source_position": r.get("source_position", {}),
                "dependencies": r.get("dependencies", []),
                "dependency_report": r["dependency_report"],
                "status": r.get("status", ""),
                "owner_agent": owner or r.get("owner_agent", ""),
            }
            for r in selected
        ],
    }
    print(json.dumps(out, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
