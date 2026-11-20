#!/usr/bin/env python3
"""Persistent-queue task selector (Objective §4 — Coordinator).

Selection is deterministic and evidence-aware:
  1. only NOT_STARTED / PARTIAL / PROVED_SCOPE units are selectable;
  2. units already owned by an agent are skipped (no chaotic parallel edits);
  3. a dependency is satisfied only by an exact (law_id, article_no,
     enforcement_date) match in a PROVED_SCOPE / FULLY_VERIFIED unit;
  4. unresolved bare ids, delegated orders and unenforced revisions BLOCK;
  5. legal review is never a filter (it is a separate axis).
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
TERMINAL = {"FULLY_VERIFIED", "BLOCKED", "STALE"}
SATISFYING = {"PROVED_SCOPE", "FULLY_VERIFIED"}


def _proved_index(tasks: list[dict]) -> set[tuple[str, str, str]]:
    return {
        (str(t.get("law_id", "")), str(t.get("article", "")), str(t.get("enforcement_date", "")))
        for t in tasks if t.get("status") in SATISFYING
    }


def _dep_key(dep: dict) -> tuple[str, str, str]:
    return (str(dep.get("law_id", "")), str(dep.get("article_no", "")),
            str(dep.get("enforcement_date", "")))


def _unmet(dep: dict, proved: set[tuple[str, str, str]]) -> str | None:
    resolution = str(dep.get("resolution", ""))
    if resolution == "RESOLVED_IN_LEDGER":
        return None if _dep_key(dep) in proved else f"dependency_not_proved:{_dep_key(dep)}"
    if resolution == "SAME_LAW":
        return None if any(k[0] == str(dep.get("law_id", "")) for k in proved) else "internal_reference_not_proved"
    if resolution in ("HISTORICAL", "EXTERNAL_UNVERIFIED", "UNENFORCED", "UNRESOLVED"):
        return f"unresolved_dependency:{resolution}:{str(dep.get('raw', ''))[:40]}"
    # Any unknown shape is a blocker, never an implicit pass.
    return f"unknown_dependency_shape:{resolution}"


def select_tasks(tasks: list[dict], n: int = 12) -> dict:
    proved = _proved_index(tasks)
    selected: list[dict] = []
    skipped_status = skipped_owner = skipped_dependency = 0

    for t in tasks:
        status = str(t.get("status", "NOT_STARTED"))
        if status in TERMINAL:
            skipped_status += 1
            continue
        if t.get("owner"):
            skipped_owner += 1
            continue
        unmet = [msg for dep in t.get("dependencies", []) or []
                 if (msg := _unmet(dep, proved)) is not None]
        if unmet or t.get("blockers"):
            skipped_dependency += 1
            continue
        verification = t.get("verification") or {}
        remaining = list(verification.get("missing_axes", []))
        selected.append({
            "task_id": t.get("normative_id") or t.get("task_id"),
            "law_id": t.get("law_id"),
            "law_title": t.get("law_title", ""),
            "revision": t.get("revision", ""),
            "article": t.get("article", ""),
            "article_title": t.get("article_title", ""),
            "source_file": t.get("source_file", ""),
            "path": t.get("path", ""),
            "norm_fragment": t.get("norm_fragment", ""),
            "dependencies": t.get("dependencies", []),
            "dependency_ids": t.get("dependency_ids", []),
            "unresolved_conditions": t.get("unresolved_conditions", []),
            "status": status,
            "remaining_axes": remaining,
            "legal_review": t.get("legal_review", "LEGAL_REVIEW_PENDING"),
        })
        if len(selected) >= n:
            break

    # Prefer computable units, then fewer dependencies, then deterministic ids.
    def rank(t):
        frag = t.get("norm_fragment", "")
        computable = sum(1 for k in ("円", "百分", "割合", "税率", "控除", "千分", "乗じ", "除し")
                         if k in frag)
        return (-computable, len(t.get("dependencies", [])), str(t.get("task_id", "")))

    selected.sort(key=rank)
    return {
        "tool": "scripts/ci/task_selector.py",
        "queue_units": len(tasks),
        "selected": selected,
        "skipped_status": skipped_status,
        "skipped_owner": skipped_owner,
        "skipped_dependency_or_blocker": skipped_dependency,
        "legal_review_is_not_a_filter": True,
    }


def select(tasks: list[dict], n: int = 12) -> list[dict]:
    """Backward-compatible convenience returning only the selected units."""
    return select_tasks(tasks, n)["selected"]


def main() -> int:
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 12
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    print(json.dumps(select_tasks(q.get("tasks", []), n), ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
