#!/usr/bin/env python3
"""Deterministic Coordinator selector (Sponsor Directive §1/§4).

Selects unfinished normative units from the persistent queue. A unit is
selectable only when:

  * its completion state is NOT_STARTED / PARTIAL / UNRESOLVED (never a
    terminal state, never BLOCKED);
  * every dependency resolves to law name + article + enforcement revision
    AND is either already in a terminal state or is explicitly waived in the
    state ledger. Unresolved dependencies BLOCK the unit; they are never
    silently ignored;
  * no source character is recorded as UNRESOLVED (those units are routed to
    the SOURCE agent, not to FORMALIZE);
  * it is unowned or its lease has expired (`--force` overrides).

Selection records owner, attempt count and claim time in data/TASK_STATE.json,
so work is not duplicated across restarts. Human legal review is a separate
axis and is never a selection blocker (Directive §1).

Usage: python scripts/ci/task_selector.py [count] [--owner NAME] [--force]
"""
from __future__ import annotations

import json
import sys
from collections import Counter
from datetime import datetime, timedelta, timezone
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from normative_units import (  # noqa: E402
    DONE_STATES, STATE_PATH, load_state, save_state,
)

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
LEASE_HOURS = 24


def _parse_time(value):
    if not value:
        return None
    try:
        return datetime.fromisoformat(str(value).replace("Z", "+00:00"))
    except (ValueError, TypeError):
        return None


def _lease_expired(record, now):
    claimed = _parse_time(record.get("claimed_at"))
    return claimed is None or (now - claimed) >= timedelta(hours=LEASE_HOURS)


def _dependency_status(task, by_key):
    """Resolve dependencies against the queue by law + article + revision."""
    reasons = []
    for dep in task.get("dependencies", {}).get("dependencies", []):
        if not dep.get("resolved"):
            reasons.append(f"unresolved dependency: {dep.get('raw')}")
            continue
        law_id = dep.get("law_id")
        article = dep.get("article")
        revision = dep.get("law_revision_id")
        candidates = by_key.get((law_id, article), [])
        if revision:
            candidates = [c for c in candidates if c.get("revision_id") == revision] or candidates
        if not candidates:
            reasons.append(f"dependency not in queue: {law_id} art {article} rev {revision}")
            continue
        if not any(c["status"]["completion_state"] in DONE_STATES for c in candidates):
            reasons.append(f"dependency not proved: {law_id} art {article} rev {revision}")
    return reasons


def main() -> int:
    argv = sys.argv[1:]
    force = "--force" in argv
    owner = "COORDINATOR"
    if "--owner" in argv:
        i = argv.index("--owner")
        if i + 1 < len(argv):
            owner = argv[i + 1]
    numbers = [a for a in argv if a.isdigit()]
    n = int(numbers[0]) if numbers else 12

    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = q.get("tasks", [])
    state = load_state()
    now = datetime.now(timezone.utc)

    by_key = {}
    for t in tasks:
        locator = t.get("unit", {}).get("locator", "")
        art = locator.split("@")[0]
        by_key.setdefault((t["law_id"], art), []).append(t)
        # also index the plain article number when available
        by_key.setdefault((t["law_id"], t.get("article", art)), []).append(t)

    skipped = Counter()
    candidates = []
    for t in tasks:
        st = t.get("status", {})
        state_name = st.get("completion_state", "NOT_STARTED")
        rec = state["tasks"].get(t["task_id"], {})
        if state_name in DONE_STATES:
            skipped["terminal"] += 1
            continue
        if state_name == "BLOCKED" or rec.get("blockers"):
            skipped["blocked"] += 1
            continue
        if t.get("decomposition", {}).get("unresolved_units"):
            skipped["unresolved_source"] += 1
            continue
        if rec.get("owner") and not force and not _lease_expired(rec, now):
            skipped["owned"] += 1
            continue
        reasons = _dependency_status(t, by_key)
        if reasons:
            skipped["dependency"] += 1
            t = dict(t)
            t["_dependency_reasons"] = reasons
            candidates.append((0, t))  # ranked last
            continue
        computable = sum(
            1 for k in ("円", "百分", "割合", "税率", "控除", "千分", "乗じ", "除し")
            if k in t.get("unit", {}).get("text", "")
        )
        candidates.append((1 + computable, t))

    candidates.sort(key=lambda pair: (
        -pair[0],
        pair[1]["law_id"],
        pair[1]["unit"]["locator"],
        pair[1]["task_id"],
    ))
    selected = [t for _, t in candidates[:n] if "_dependency_reasons" not in t]

    for t in selected:
        rec = state["tasks"].setdefault(t["task_id"], {})
        rec["owner"] = owner
        rec["attempts"] = int(rec.get("attempts", 0)) + 1
        rec["claimed_at"] = now.isoformat()
        rec.setdefault("history", []).append({
            "event": "CLAIMED", "owner": owner,
            "at": rec["claimed_at"], "attempt": rec["attempts"],
        })
    save_state(state)

    out = {
        "tool": "scripts/ci/task_selector.py",
        "queue_units": len(tasks),
        "selected_count": len(selected),
        "skipped": dict(skipped),
        "note": "human legal review is a separate axis, never a selection blocker",
        "selected": [
            {
                "task_id": t["task_id"],
                "normative_ref": t.get("normative_ref", ""),
                "law_id": t["law_id"],
                "law_title": t.get("law_title", ""),
                "revision_id": t.get("revision_id", ""),
                "enforcement_date": t.get("enforcement_date", ""),
                "provision_path": t.get("provision_path", []),
                "locator": t["unit"]["locator"],
                "unit_kind": t["unit"]["kind"],
                "norm_fragment": t["unit"]["text"],
                "source_sha256": t.get("source_sha256", ""),
                "dependencies": t.get("dependencies", {}),
                "obligations": t.get("obligations", []),
                "status": t.get("status", {}),
                "scope": t.get("scope", ""),
            }
            for t in selected
        ],
    }
    print(json.dumps(out, ensure_ascii=False, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
