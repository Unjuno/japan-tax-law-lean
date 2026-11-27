#!/usr/bin/env python3
"""Second-stage evidence compaction: shorten redundant SHA-256 prefixes.

The ledger stores full 64-hex SHA-256 strings in several axes per unit. For
identification purposes a 16-hex prefix (64 bits) is sufficient, and the full
hash remains computable from the pinned artifact. This migration also replaces
the repeated verbose `namespace JapanTaxLaw.<batch>.<ns>` text in bulk entries
with a compact `ns=<ns>` marker while keeping the module path.

No status, obligation, proof claim or artifact path is changed. Run with
--write to apply; otherwise prints the projected reduction.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data" / "verification_evidence.json"
SHA64 = re.compile(r"sha256=([0-9a-f]{64})")
NAMESPACE = re.compile(r"namespace JapanTaxLaw\.(Bulk[A-Za-z0-9]+)\.(x[0-9a-f]+)")
AXES = ("source_location", "decomposition_audit", "source_correspondence_audit",
        "independent_spec", "implementation", "kernel_proof", "proof_scope",
        "boundary_proof", "cross_law_proof", "tests", "adversarial_review")


def compact_value(value: str) -> str:
    value = SHA64.sub(lambda m: "sha256=" + m.group(1)[:16], value)
    value = NAMESPACE.sub(lambda m: f"batch={m.group(1)} ns={m.group(2)}", value)
    return value


def main() -> int:
    write = "--write" in sys.argv
    raw = OUT.read_text(encoding="utf-8")
    data = json.loads(raw)
    units = data.get("units", {})
    before = {uid: dict(rec) for uid, rec in units.items()}
    migrated = {
        uid: {axis: compact_value(value) if isinstance(value, str) else value
              for axis, value in rec.items()}
        for uid, rec in units.items()
    }
    changed = sum(1 for uid in units if migrated[uid] != before[uid])
    bad = [uid for uid, rec in migrated.items()
           if any(not str(rec.get(axis, "")).strip() for axis in AXES)]
    new_raw = json.dumps(data | {"units": migrated}, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n"
    print(f"units={len(units)} migrated={changed} missing_axis={len(bad)}")
    print(f"bytes before={len(raw.encode('utf-8'))} after={len(new_raw.encode('utf-8'))}")
    if bad:
        print("REFUSING: migration would empty an evidence axis")
        return 1
    if write:
        OUT.write_text(new_raw, encoding="utf-8")
        print("wrote compacted ledger")
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    sys.exit(main())
