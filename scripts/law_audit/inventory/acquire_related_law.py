#!/usr/bin/env python3
"""Acquire ONE related statute as a SEPARATE source layer (Objective §2).

Laws discovered by `recursive_discovery_resolve.py` are candidates, not
acquired targets. This script pins an official e-Gov revision + raw snapshot
for a nominated related law WITHOUT touching `data/INVENTORY.json`:

  * revisions and law_data are fetched through the existing on-disk HTTP cache;
  * the applicable revision is selected as of 2026-11-15;
  * the raw bytes are written to `data/related_raw/` with SHA-256;
  * `data/RELATED_LAW_LEDGER.json` records provenance and the honest status
    `ACQUIRED_NOT_PARSED_NOT_MODELLED`.

Usage: python scripts/law_audit/inventory/acquire_related_law.py <law_id> [...]
Default: 322AC0000000067 (地方自治法), the highest-frequency non-tax related
statute relevant to local tax ordinances.
"""
from __future__ import annotations

import datetime as _dt
import hashlib
import json
import sys
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
CACHE = REPO / "build" / "inventory_cache"
RAW = REPO / "data" / "related_raw"
LEDGER = REPO / "data" / "RELATED_LAW_LEDGER.json"
API = "https://laws.e-gov.go.jp/api/2"
REVISIONS_URL = API + "/law_revisions/{law_id}"
LAW_DATA_URL = API + "/law_data/{revision_id}"
SNAPSHOT = "2026-11-15"
TODAY = _dt.date(2026, 11, 15)
DEFAULT_IDS = ["322AC0000000067"]


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def fetch(url: str) -> bytes:
    key = hashlib.sha256(url.encode("utf-8")).hexdigest()
    cache = CACHE / f"{key}.json"
    if cache.exists():
        return cache.read_bytes()
    with urllib.request.urlopen(url, timeout=60) as resp:
        data = resp.read()
    CACHE.mkdir(parents=True, exist_ok=True)
    cache.write_bytes(data)
    return data


def select_revision(revisions: list[dict]) -> tuple[dict | None, str]:
    enforced = [r for r in revisions if r.get("current_revision_status") == "CurrentEnforced"]
    if enforced:
        enforced.sort(key=lambda r: (r.get("amendment_enforcement_date") or ""), reverse=True)
        return enforced[0], ("current_enforced" if len(enforced) == 1
                             else f"current_enforced_ambiguous_{len(enforced)}")
    cand = [r for r in revisions
            if (r.get("amendment_enforcement_date") or "") <= SNAPSHOT
            and r.get("current_revision_status") != "UnEnforced"]
    if cand:
        cand.sort(key=lambda r: r.get("amendment_enforcement_date") or "", reverse=True)
        return cand[0], "historical_fallback"
    if any(r.get("current_revision_status") == "UnEnforced" for r in revisions):
        return None, "fully_unenforced"
    return None, ("status_unknown" if revisions else "empty")


def acquire(law_id: str) -> dict:
    rev_bytes = fetch(REVISIONS_URL.format(law_id=law_id))
    rev_doc = json.loads(rev_bytes)
    info = rev_doc.get("law_info") or {}
    selected, status = select_revision(rev_doc.get("revisions") or [])
    if selected is None:
        return {"law_id": law_id, "acquisition_status": "NOT_ACQUIRED",
                "reason": status, "official_title": info.get("law_title", "")}
    rid = selected.get("law_revision_id")
    if not rid:
        return {"law_id": law_id, "acquisition_status": "NOT_ACQUIRED",
                "reason": "missing_law_revision_id"}
    raw_bytes = fetch(LAW_DATA_URL.format(revision_id=rid))
    payload = json.loads(raw_bytes)
    if not isinstance(payload.get("law_full_text"), dict):
        return {"law_id": law_id, "acquisition_status": "NOT_ACQUIRED",
                "reason": "law_full_text_missing", "revision_id": rid}
    RAW.mkdir(parents=True, exist_ok=True)
    dest = RAW / f"{rid}.law.json"
    if not dest.exists() or dest.read_bytes() != raw_bytes:
        dest.write_bytes(raw_bytes)
    return {
        "law_id": law_id,
        "official_title": selected.get("law_title") or info.get("law_title", ""),
        "law_num": info.get("law_num", ""),
        "law_type": selected.get("law_type") or info.get("law_type", ""),
        "law_revision_id": rid,
        "revision_selection": status,
        "amendment_enforcement_date": selected.get("amendment_enforcement_date", ""),
        "source_layer": "NATIONAL_NON_TAX_RELATED",
        "acquisition_status": "ACQUIRED",
        "verification_status": "ACQUIRED_NOT_PARSED_NOT_MODELLED_NOT_REVIEWED",
        "revisions_url": REVISIONS_URL.format(law_id=law_id),
        "revisions_sha256": sha(rev_bytes),
        "source_url": LAW_DATA_URL.format(revision_id=rid),
        "raw_snapshot": f"data/related_raw/{rid}.law.json",
        "raw_sha256": sha(raw_bytes),
        "raw_size_bytes": len(raw_bytes),
        "snapshot_date": SNAPSHOT,
    }


def main() -> int:
    ids = sys.argv[1:] or DEFAULT_IDS
    ledger = json.loads(LEDGER.read_text(encoding="utf-8")) if LEDGER.exists() else {
        "tool": "scripts/law_audit/inventory/acquire_related_law.py",
        "claim": "acquired provenance only; not parsed, not modelled, not reviewed",
        "laws": {},
    }
    ledger.setdefault("laws", {})
    errors = []
    for lid in ids:
        rec = acquire(lid)
        if rec.get("acquisition_status") != "ACQUIRED":
            errors.append(f"{lid}: {rec.get('reason')}")
            continue
        ledger["laws"][lid] = rec
        print(f"ACQUIRED {lid} {rec['official_title']} {rec['law_revision_id']} "
              f"sha256={rec['raw_sha256']} bytes={rec['raw_size_bytes']}")
    LEDGER.parent.mkdir(parents=True, exist_ok=True)
    LEDGER.write_text(json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True), encoding="utf-8")
    print(f"related-law ledger: {len(ledger['laws'])} acquired; errors={len(errors)}")
    for e in errors:
        print("ERROR", e)
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
