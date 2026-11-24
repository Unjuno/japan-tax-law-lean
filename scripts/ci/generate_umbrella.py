#!/usr/bin/env python3
"""Deterministically regenerate JapanTaxLaw.lean from JapanTaxLaw/*.lean.

Repeated append-style import repairs had accumulated duplicate imports (387 on
2026-11-24) and still left modules missing after stale-base rewrites. This
generator makes the umbrella a pure, sorted, deduplicated function of the files
on disk, so drift is both trivially repairable and independently detectable.

Usage:
  python scripts/ci/generate_umbrella.py            # write canonical umbrella
  python scripts/ci/generate_umbrella.py --check    # verify only (CI)
"""
from __future__ import annotations
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
UMBRELLA = REPO / "JapanTaxLaw.lean"
MODULES_DIR = REPO / "JapanTaxLaw"


def canonical_text() -> str:
    mods = sorted("JapanTaxLaw." + p.stem for p in MODULES_DIR.glob("*.lean"))
    return "\n".join("import " + m for m in mods) + "\n"


def main() -> int:
    expected = canonical_text()
    actual = UMBRELLA.read_text(encoding="utf-8") if UMBRELLA.exists() else ""
    if "--check" in sys.argv:
        ok = actual == expected
        exp_lines = expected.splitlines()
        act_lines = actual.splitlines()
        print(f"umbrella canonical: {'OK' if ok else 'FAIL'} "
              f"expected={len(exp_lines)} actual={len(act_lines)} "
              f"duplicates={len(act_lines) - len(set(act_lines))}")
        return 0 if ok else 1
    UMBRELLA.write_text(expected, encoding="utf-8")
    print(f"wrote {len(expected.splitlines())} unique imports from {len(list(MODULES_DIR.glob('*.lean')))} modules")
    return 0


if __name__ == "__main__":
    sys.exit(main())
