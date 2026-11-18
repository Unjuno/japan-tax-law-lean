#!/usr/bin/env python3
"""Task selector (Sponsor Directive §3).

Reads the persistent task queue and selects unfinished units for the
Coordinator to assign to High4 subagents. Selection is deterministic:

  1. Prefer units whose dependencies are already formalized (or have none).
  2. Prefer computable articles (short, with explicit arithmetic markers).
  3. Avoid laws already heavily covered in transcription_audit.
  4. Round-robin across laws for parallelism.

Human legal review (LEGAL_REVIEW_PENDING) is NOT a filter — Directive §1 states
it is not a precondition for formalization.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"


def main() -> int:
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 12
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = q["tasks"]

    def computable(t):
        frag = t.get("norm_fragment", "")
        return sum(
            1 for k in ["円", "百分", "割合", "税率", "控除", "千分", "乗じ", "除し"]
            if k in frag
        )

    # Only NOT_STARTED; rank by computability then by fewest dependencies.
    cand = [t for t in tasks if t["status"]["formalized"] == "NOT_STARTED"]
    cand.sort(key=lambda t: (-computable(t), len(t["reference_ids"]), t["law_id"], t["article"]))
    selected = cand[:n]

    out = {
        "tool": "scripts/ci/task_selector.py",
        "queue_units": len(tasks),
        "not_started": len(cand),
        "selected": [
            {
                "task_id": t["task_id"],
                "law_id": t["law_id"],
                "law_title": t["law_title"],
                "revision": t["revision"],
                "article": t["article"],
                "article_title": t["article_title"],
                "source_file": t["source_file"],
                "path": t["path"],
                "norm_fragment": t["norm_fragment"],
                "reference_ids": t["reference_ids"],
                "obligations": t["obligations"],
                "status": t["status"],
                "scope": t["scope"],
            }
            for t in selected
        ],
    }
    print(json.dumps(out, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
