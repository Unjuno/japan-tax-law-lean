#!/usr/bin/env python3
"""Restore pinned discovered-law snapshots from the e-Gov HTTP cache.

The acquisition ledger records source_file + source_sha256 for each discovered
law. If snapshot bytes are removed (e.g. workspace cleanup), this script
re-materialises them from build_inventory's URL cache or e-Gov and refuses to
restore anything whose SHA-256 does not match the recorded pin. No law is
marked acquired until its bytes are present and hash-verified.

Usage: python scripts/law_audit/inventory/restore_discovered_snapshots.py
"""
from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import build_inventory as bi  # noqa: E402

REPO = HERE.parents[2]
LEDGER = REPO / "data" / "DISCOVERED_INVENTORY.json"


def main() -> int:
    ledger = json.loads(LEDGER.read_text(encoding="utf-8"))
    restored = verified = missing = 0
    for lid, rec in ledger.get("laws", {}).items():
        rel = rec.get("source_file") or ""
        expected = (rec.get("source_sha256") or "").upper()
        if not rel or not expected:
            continue
        dest = REPO / rel
        if dest.exists():
            actual = hashlib.sha256(dest.read_bytes()).hexdigest().upper()
            if actual == expected:
                verified += 1
            else:
                rec["acquisition_status"] = "SNAPSHOT_HASH_MISMATCH"
                rec["verification_error"] = "HASH_MISMATCH"
                missing += 1
            continue
        rev = rec.get("law_revision_id") or rec.get("revision") or ""
        try:
            raw = bi.http_get_bytes(bi.LAW_DATA_URL.format(law_revision_id=rev))
        except Exception as exc:  # noqa: BLE001
            rec["acquisition_status"] = "SNAPSHOT_FETCH_FAILED"
            rec["verification_error"] = str(exc)[:200]
            missing += 1
            continue
        actual = hashlib.sha256(raw).hexdigest().upper()
        if actual != expected:
            rec["acquisition_status"] = "SNAPSHOT_HASH_MISMATCH"
            rec["verification_error"] = "REFETCH_HASH_MISMATCH"
            missing += 1
            continue
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(raw)
        rec["acquisition_status"] = "ACQUIRED"
        rec.pop("verification_error", None)
        restored += 1
    ledger["laws_acquired_total"] = sum(
        1 for r in ledger.get("laws", {}).values()
        if r.get("acquisition_status") == "ACQUIRED")
    LEDGER.write_text(json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                      encoding="utf-8")
    print(f"restored={restored} already_verified={verified} unresolved={missing} "
          f"acquired_total={ledger['laws_acquired_total']}")
    return 0 if missing == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
