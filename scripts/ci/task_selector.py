#!/usr/bin/env python3
"""Dependency-aware task selector (Objective §1 / §4).

Reads the persistent norm-unit queue and selects unfinished obligations for
the Coordinator to assign to High4 subagents.  Selection is deterministic for
a given state and:

  1. excludes BLOCKED units and units owned by an agent unless the assignment
     is stale;
  2. requires internal (law-level) dependencies to be proved before a unit is
     selected; unresolved external dependencies are reported, not hidden;
  3. prefers incompletely decomposed / unresolved units and computable text;
  4. round-robins across laws for parallelism;
  5. persists the assignment in the durable state overlay so a session restart
     does not reassign the same unit.

Human legal review (PENDING_HUMAN) is not a selection filter — it is a
separate axis.  A unit is never selected merely because a file or name matched.
"""
from __future__ import annotations

import json
import sys
import time
from pathlib import Path

from norm_identity import (
    BLOCKED, FULLY_VERIFIED, NOT_STARTED, PARTIAL, PROVED_SCOPE,
    UNRESOLVED, apply_overlay, load_state, save_state,
)

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
STATE = REPO / "state" / "norm_task_state.json"
STALE_AFTER_SECONDS = 6 * 60 * 60

COMPUTABLE_MARKERS = [
    "円", "百分", "割合", "税率", "控除", "千分", "乗じ", "除し", "境界", "端数",
]


def computable_score(unit: dict) -> int:
    text = unit.get("text") or unit.get("norm_fragment", "")
    return sum(1 for k in COMPUTABLE_MARKERS if k in text)


def dependency_report(unit: dict, law_status: dict) -> dict:
    internal = unit.get("dependency_law_ids", [])
    unresolved = [lid for lid in internal if law_status.get(lid) not in
                  (PROVED_SCOPE, FULLY_VERIFIED)]
    channels = unit.get("dependencies", {}).get("resolution_channels", [])
    return {
        "internal_law_ids": internal,
        "unresolved_internal": unresolved,
        "satisfied": not unresolved,
        "other_channels_recorded": channels,
        "raw_15digit_only": (channels == ["raw15digit"]),
    }


def main() -> int:
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 12
    agent = sys.argv[2] if len(sys.argv) > 2 else "COORDINATOR"
    # Units are regenerated deterministically from pinned snapshots and merged
    # with the durable overlay; the queue file is only a compact manifest.
    import task_queue
    state = load_state(STATE)
    tasks, _reports, _inv = task_queue.generate_units()
    apply_overlay(tasks, state)

    # Law-level dependency status: a dependency law is proved only if it has a
    # norm unit in PROVED_SCOPE / FULLY_VERIFIED.
    law_status = {}
    for t in tasks:
        lid = t["law_id"]
        if t["status"] in (PROVED_SCOPE, FULLY_VERIFIED):
            law_status[lid] = FULLY_VERIFIED

    overlay = state.get("records", {})
    now = time.time()

    assigned_per_law = {}
    for o in overlay.values():
        if o.get("owner"):
            lid = o.get("law_id", "")
            assigned_per_law[lid] = assigned_per_law.get(lid, 0) + 1

    candidates = []
    skipped = {
        "blocked": 0, "wrong_status": 0, "owned": 0,
        "dependency_unresolved": 0, "coverage_failed": 0,
    }
    for t in tasks:
        st = t.get("status")
        if st == BLOCKED or t.get("blocker"):
            skipped["blocked"] += 1
            continue
        if st not in (NOT_STARTED, PARTIAL):
            skipped["wrong_status"] += 1
            continue
        if not (t.get("coverage_evidence") or {}).get("covered"):
            skipped["coverage_failed"] += 1
            continue
        prev = overlay.get(t["norm_id"], {})
        owner = prev.get("owner") or t.get("owner", "")
        assigned_at = float(prev.get("assigned_at") or t.get("assigned_at") or 0)
        if owner and owner != agent and (now - assigned_at) < STALE_AFTER_SECONDS:
            skipped["owned"] += 1
            continue
        dep = dependency_report(t, law_status)
        if not dep["satisfied"]:
            skipped["dependency_unresolved"] += 1
            continue
        score = (
            (2 if t.get("kind") == UNRESOLVED else 0)
            + (1 if st == PARTIAL else 0)
            + computable_score(t)
        )
        candidates.append((score, assigned_per_law.get(t["law_id"], 0),
                           t["law_id"], t["article_no"], t["norm_id"], t, dep))

    candidates.sort(key=lambda x: (-x[0], x[1], x[2], x[3], x[4]))
    selected = []
    for score, _count, _lid, _art, _nid, t, dep in candidates[:n]:
        t["owner"] = agent
        t["assigned_at"] = now
        t["status"] = PARTIAL if t["status"] == NOT_STARTED else t["status"]
        record = overlay.get(t["norm_id"], {})
        record.update({
            "source_sha256": t.get("source_sha256"),
            "status": t["status"],
            "owner": agent,
            "assigned_at": now,
            "law_id": t["law_id"],
            "article_no": t.get("article_no", ""),
            "evidence": t.get("evidence", {}),
            "history": t.get("history", []),
        })
        overlay[t["norm_id"]] = record
        selected.append({
            "norm_id": t["norm_id"],
            "law_id": t["law_id"],
            "law_title": t.get("law_title", ""),
            "revision": t.get("revision_id", ""),
            "article_no": t.get("article_no", ""),
            "paragraph_no": t.get("paragraph_no", ""),
            "item_no": t.get("item_no", ""),
            "table_cell": t.get("table_cell", ""),
            "provision_kind": t.get("provision_kind", ""),
            "kind": t.get("kind", ""),
            "text": t.get("text", ""),
            "source_file": t.get("source_file", ""),
            "char_start": t.get("char_start"),
            "char_end": t.get("char_end"),
            "dependencies": dep,
            "obligations": t.get("obligations", []),
            "status": t["status"],
            "owner": agent,
            "selection_score": score,
        })

    state["records"] = overlay
    save_state(STATE, state)

    out = {
        "tool": "scripts/ci/task_selector.py",
        "queue_units": len(tasks),
        "candidates": len(candidates),
        "skipped": skipped,
        "selected_count": len(selected),
        "selected": selected,
        "note": "SKIPPED counts are not PASS counts; legal review is a separate axis.",
    }
    print(json.dumps(out, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
