#!/usr/bin/env python3
"""Remove evidence references that no longer resolve to a current artifact.

A FULLY_VERIFIED unit whose evidence names a Lean file that is absent (or whose
SHA-256 no longer matches) must not stay verified. This tool removes only those
broken axis references; the queue generator re-derives the status from the
remaining evidence. It never adds evidence and never touches legal review.
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
EVIDENCE = REPO / "data" / "verification_evidence.json"
QUEUE = REPO / "build" / "task_queue.json"
HASH_REF = re.compile(r"(JapanTaxLaw/[\w.]+\.lean)\s+sha256=([0-9a-f]{64})")
AXES = ("implementation", "independent_spec", "tests")


def broken(rel: str, claimed: str) -> bool:
    p = REPO / rel
    if not p.exists():
        return True
    actual = hashlib.sha256(p.read_bytes().replace(b"\r\n", b"\n")).hexdigest()
    return actual != claimed


def main() -> int:
    data = json.loads(EVIDENCE.read_text(encoding="utf-8"))
    units = data.get("units", {})
    removed = []
    for uid, axes in units.items():
        for axis in AXES:
            ref = str(axes.get(axis, ""))
            matches = list(HASH_REF.finditer(ref))
            if any(broken(m.group(1), m.group(2)) for m in matches):
                axes[axis] = ""
                removed.append(f"{uid[:18]}:{axis}")
    if removed:
        EVIDENCE.write_text(json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                            encoding="utf-8")
    print("pruned broken evidence axes:", len(removed))
    for r in removed[:20]:
        print(" ", r)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
