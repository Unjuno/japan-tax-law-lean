#!/usr/bin/env python3
"""Audit that every artifact path cited by verification evidence exists.

This is a Lean- and queue-independent integrity check: evidence text that
names a spec, implementation, test, adversarial note or pinned source must
point to a file in the repository. Missing artifacts are reported with their
normative unit id; the script exits non-zero when any are missing.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
EVIDENCE = REPO / "data/verification_evidence.json"
HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))
import evidence_store  # noqa: E402
PATH_RE = re.compile(r"(?:JapanTaxLaw|data/raw|docs)/[A-Za-z0-9_\-\./\\]+\.(?:lean|json|md)")


def cited_paths(text: str) -> list[str]:
    return sorted(set(PATH_RE.findall(text)))


def main() -> int:
    units = evidence_store.load_units(REPO)
    missing: list[tuple[str, str]] = []
    for uid, rec in units.items():
        for axis, value in rec.items():
            if not isinstance(value, str):
                continue
            for p in cited_paths(value):
                if not (REPO / p).exists():
                    missing.append((uid, p))
    print(f"evidence artifact audit: units={len(units)} "
          f"missing={len(missing)}")
    for uid, p in missing[:50]:
        print("MISSING", uid[:24], p)
    return 1 if missing else 0


if __name__ == "__main__":
    sys.exit(main())
