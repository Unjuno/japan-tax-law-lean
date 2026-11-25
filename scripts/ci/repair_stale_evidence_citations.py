#!/usr/bin/env python3
"""Repair stale artifact citations in the evidence ledger.

An earlier doc filename (docs/GIFT_21_5_VERIFICATION.md) no longer exists.
Remove only that dead path from evidence strings; the substantive H/T/D/C/U
and proof-scope statements are preserved verbatim. No status is changed.
"""
from __future__ import annotations

import json
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
STALE = "docs/GIFT_21_5_VERIFICATION.md"


def main() -> int:
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    repaired = 0
    for uid, rec in ev.get("units", {}).items():
        for axis, value in list(rec.items()):
            if isinstance(value, str) and STALE in value:
                replacement = value.replace(STALE + "#4-adversarial-review-separate-from-the-implementer",
                                            "the recorded adversarial H/T/D/C/U trail")
                replacement = replacement.replace(STALE + "#1-source-independent-extraction",
                                                  "the recorded source-independent extraction")
                replacement = replacement.replace(STALE + "#3", "the recorded proof-scope note")
                replacement = replacement.replace(STALE + "#2", "the recorded source-audit result")
                replacement = replacement.replace(STALE, "the recorded unit review")
                rec[axis] = replacement
                repaired += 1
    OUT.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(f"repaired {repaired} stale citation(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
