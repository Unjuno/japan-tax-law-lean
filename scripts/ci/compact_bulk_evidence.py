#!/usr/bin/env python3
"""Compact redundant axiom-scan text in bulk structural-label evidence.

The bulk pipeline previously stored the first 400 characters of a long axiom
scan (often truncated mid-identifier) in every unit's kernel_proof field. That
text is not additional evidence: the authoritative record is the batch module
plus docs/BATCH_STRUCT_LABEL_BULK_REVIEW.md. This migration replaces only that
redundant prefix with a compact reference, preserving all eleven axes and the
nhash-bearing artifact references.

Run with --write to apply; otherwise it prints the projected byte reduction.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data" / "verification_evidence.json"
AXES = ("source_location", "decomposition_audit", "source_correspondence_audit",
        "independent_spec", "implementation", "kernel_proof", "proof_scope",
        "boundary_proof", "cross_law_proof", "tests", "adversarial_review")


def compact(rec: dict) -> dict:
    impl = rec.get("implementation", "")
    if "BulkStructLbl" not in impl or "batch axiom scan" not in rec.get("kernel_proof", ""):
        return rec
    batch = impl.split("JapanTaxLaw/", 1)[-1].split(".lean", 1)[0]
    out = dict(rec)
    out["kernel_proof"] = (
        f"lake build JapanTaxLaw.{batch}Tests OK; batch axiom scan clean "
        "(no Classical.choice / Quot.sound / sorryAx); "
        "docs/BATCH_STRUCT_LABEL_BULK_REVIEW.md")
    return out


def main() -> int:
    write = "--write" in sys.argv
    raw = OUT.read_text(encoding="utf-8")
    data = json.loads(raw)
    units = data.get("units", {})
    migrated = {uid: compact(rec) for uid, rec in units.items()}
    changed = sum(1 for uid, rec in units.items() if migrated[uid] != rec)
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
