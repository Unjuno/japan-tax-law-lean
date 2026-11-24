#!/usr/bin/env python3
"""Restore umbrella imports for every on-disk module (integrity repair).

The queue invariant `umbrella imports retained` requires that every
`JapanTaxLaw/*.lean` be imported by `JapanTaxLaw.lean` so the axiom probe can
resolve every constant. This tool repairs a stale-base umbrella rewrite by
appending the missing imports deterministically. It never removes imports.
"""
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
umb = REPO / "JapanTaxLaw.lean"
text = umb.read_text(encoding="utf-8")
imported = {
    line.strip()[len("import "):].strip()
    for line in text.splitlines()
    if line.strip().startswith("import JapanTaxLaw.")
}
disk = {"JapanTaxLaw." + p.stem for p in (REPO / "JapanTaxLaw").glob("*.lean")}
missing = sorted(disk - imported)
print(f"on-disk modules={len(disk)} imported={len(imported)} missing={len(missing)}")
for name in missing:
    print("  +", name)
if missing:
    body = text.rstrip("\n")
    umb.write_text(body + "\n" + "\n".join("import " + m for m in missing) + "\n",
                   encoding="utf-8")
print("restored", len(missing), "umbrella imports")
