#!/usr/bin/env python3
"""Progress ledger (Directive §5): count reductions, not model additions.

A new Lean model must NOT be counted as formalisation progress unless the
number of unverified normative units actually decreases. This tool snapshots
the queue's status counts at each HEAD, diffs newly added Lean modules against
the previous snapshot commit, and records an explicit verdict:

  COUNTED   - at least one norm moved out of NOT_STARTED
  UNCOUNTED - modules were added but NOT_STARTED did not decrease

No claim of completeness is made; this is a measurement aid only.
Regenerate with `python scripts/ci/progress_ledger.py`.
"""
from __future__ import annotations

import json
import re
import subprocess
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
QUEUE_MD = REPO / "docs/TASK_QUEUE.md"
HISTORY = REPO / "data/PROGRESS_HISTORY.json"
OUT = REPO / "docs/PROGRESS_DELTA.md"

STATES = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED")


def git(*args: str) -> str:
    return subprocess.run(["git", *args], cwd=REPO, capture_output=True, text=True).stdout.strip()


def read_counts() -> dict[str, int]:
    text = QUEUE_MD.read_text(encoding="utf-8")
    return {s: int(m.group(1)) for s in STATES
            if (m := re.search(r"\|\s*" + s + r"\s*\|\s*(\d+)\s*\|", text))}


def new_modules(prev: str, head: str) -> list[str]:
    if not prev or prev == head:
        return []
    diff = git("diff", "--name-status", "--diff-filter=A", prev, head, "--", "JapanTaxLaw")
    return [line.split("\t", 1)[1] for line in diff.splitlines() if "\t" in line]


def main() -> int:
    head = git("rev-parse", "HEAD")
    counts = read_counts()
    hist = json.loads(HISTORY.read_text(encoding="utf-8")) if HISTORY.exists() else {"snapshots": []}
    snaps = hist.setdefault("snapshots", [])
    prev_snap = snaps[-1] if snaps else None
    prev_head = prev_snap.get("head", "") if prev_snap else ""
    added = new_modules(prev_head, head)

    if prev_snap and prev_snap.get("head") == head:
        verdict, delta = prev_snap["verdict"], prev_snap["delta"]
    else:
        delta = {s: counts.get(s, 0) - prev_snap.get("counts", {}).get(s, counts.get(s, 0))
                 for s in STATES} if prev_snap else {s: 0 for s in STATES}
        reduced = delta.get("NOT_STARTED", 0) < 0
        verdict = "COUNTED" if reduced else ("UNCOUNTED" if added else "NO_CHANGE")
        snapshot = {"head": head, "counts": counts, "delta": delta,
                    "new_modules": added, "verdict": verdict}
        if not snaps or snaps[-1].get("head") != head:
            snaps.append(snapshot)
        HISTORY.write_text(json.dumps(hist, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                           encoding="utf-8")

    lines = [
        "# Formalisation progress (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/progress_ledger.py`.",
        "",
        "Directive §5: a new model counts as progress ONLY when the number of",
        "unverified units decreases. This ledger records measured deltas, not",
        "the count of models or theorems. It makes no completion claim.",
        "",
        f"head: `{head[:12]}`",
        f"verdict: **{verdict}**",
        "",
        "| status | count | delta |",
        "|---|---:|---:|",
        *[f"| {s} | {counts.get(s,0)} | {delta.get(s,0):+d} |" for s in STATES],
        "",
        f"new Lean modules since previous snapshot: {len(added)}",
        f"NOT_STARTED reduction: {-delta.get('NOT_STARTED',0)}",
        "",
    ]
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"progress: {verdict}; NOT_STARTED delta {delta.get('NOT_STARTED',0):+d}; "
          f"new modules {len(added)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
