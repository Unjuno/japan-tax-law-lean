#!/usr/bin/env python3
"""Pin HISTORICAL / UNENFORCED e-Gov revisions as a separate source layer (§2).

This adapter never touches the 327-law enforced snapshot ledger. It downloads a
small, explicit set of non-current revisions for laws already in INVENTORY,
validates each response as a real law-data JSON (with law_full_text), and pins
the raw bytes with SHA-256 into data/raw_historical/. The result is recorded in
data/HISTORICAL_PINNED.json as L6_HISTORICAL: acquisition only, verification
OUT_OF_SCOPE. Nothing here is parsed, formalized, proved or legally reviewed.

Usage:
  python scripts/ci/acquire_historical_revisions.py --limit 4
"""
from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parents[1] / "law_audit" / "inventory"
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import build_inventory as bi  # noqa: E402

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
RAW_DIR = REPO / "data" / "raw_historical"
OUT = REPO / "data" / "HISTORICAL_PINNED.json"
OUT_MD = REPO / "docs" / "HISTORICAL_PINNED.md"


def load_inventory() -> list[dict]:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", []) if isinstance(inv, dict) else inv
    return laws if isinstance(laws, list) else []


def load_ledger() -> dict:
    if OUT.exists():
        try:
            return json.loads(OUT.read_text(encoding="utf-8"))
        except (ValueError, OSError):
            pass
    return {
        "tool": "scripts/ci/acquire_historical_revisions.py",
        "claim": "historical/unenforced revision snapshots pinned only; "
                 "not parsed, formalized, proved or legally reviewed; separate L6 denominator",
        "verification_status": "OUT_OF_SCOPE",
        "revisions": {},
    }


def valid_law_data(data: bytes) -> bool:
    try:
        payload = json.loads(data)
    except (ValueError, UnicodeDecodeError):
        return False
    if not isinstance(payload, dict) or not payload.get("law_full_text"):
        return False
    return True


def acquire_one(law_id: str, rev: dict) -> dict:
    rev_id = str(rev.get("law_revision_id") or "")
    rec = {
        "law_id": law_id,
        "law_revision_id": rev_id,
        "enforcement_date": str(rev.get("amendment_enforcement_date") or ""),
        "revision_status": str(rev.get("current_revision_status") or ""),
        "source_url": bi.LAW_DATA_URL.format(law_revision_id=rev_id),
        "raw_file": "",
        "raw_sha256": "",
        "raw_bytes": 0,
        "acquisition_status": "UNKNOWN",
    }
    if not rev_id:
        rec["acquisition_status"] = "REVISION_ID_MISSING"
        return rec
    try:
        raw = bi.http_get_bytes(rec["source_url"])
    except Exception as exc:  # network failure is a recorded status
        rec["acquisition_status"] = "FETCH_FAILED"
        rec["note"] = str(exc)[:300]
        return rec
    if not valid_law_data(raw):
        rec["acquisition_status"] = "NOT_LAW_DATA"  # rejects HTML 404 templates
        return rec
    RAW_DIR.mkdir(parents=True, exist_ok=True)
    dest = RAW_DIR / f"{rev_id}.law.json"
    if not dest.exists():
        dest.write_bytes(raw)
    on_disk = dest.read_bytes()
    if hashlib.sha256(on_disk).digest() != hashlib.sha256(raw).digest():
        rec["acquisition_status"] = "SNAPSHOT_HASH_MISMATCH"
        return rec
    rec["raw_file"] = str(dest.relative_to(REPO)).replace("\\", "/")
    rec["raw_sha256"] = hashlib.sha256(on_disk).hexdigest()
    rec["raw_bytes"] = len(on_disk)
    rec["acquisition_status"] = "ACQUIRED_PINNED"
    return rec


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=4)
    args = ap.parse_args()
    ledger = load_ledger()
    revs_ledger = ledger.setdefault("revisions", {})
    acquired = 0
    for law in load_inventory():
        if acquired >= args.limit:
            break
        law_id = str(law.get("law_id") or "")
        if not law_id or any(v.get("law_id") == law_id for v in revs_ledger.values()):
            continue
        try:
            data = bi.http_get_bytes(bi.REVISIONS_URL.format(law_id=law_id))
            payload = json.loads(data)
        except Exception as exc:
            continue
        non_current = [r for r in (payload.get("revisions") or [])
                       if r.get("current_revision_status") != "CurrentEnforced"
                       and r.get("law_revision_id")]
        # prefer an already-in-force historical revision (not a future UnEnforced one)
        non_current.sort(key=lambda r: (r.get("current_revision_status") == "UnEnforced",
                                        -(int(str(r.get("amendment_enforcement_date") or "")[:4] or 0))))
        for rev in non_current:
            if acquired >= args.limit:
                break
            rev_id = str(rev.get("law_revision_id"))
            if rev_id in revs_ledger:
                continue
            rec = acquire_one(law_id, rev)
            revs_ledger[rev_id] = rec
            if rec["acquisition_status"] == "ACQUIRED_PINNED":
                acquired += 1
    ledger["count_total"] = len(revs_ledger)
    ledger["count_acquired"] = sum(
        1 for v in revs_ledger.values() if v.get("acquisition_status") == "ACQUIRED_PINNED")
    OUT.write_text(json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    lines = [
        "# Historical revisions pinned (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/ci/acquire_historical_revisions.py`.",
        "",
        "Objective §2: historical / unenforced revisions are a SEPARATE denominator.",
        "These snapshots are pinned only — NOT parsed, formalized, proved or legally reviewed.",
        "",
        f"- revisions recorded: {ledger['count_total']}",
        f"- ACQUIRED_PINNED: {ledger['count_acquired']}",
        f"- verification_status: {ledger['verification_status']}",
        "",
        "| law_id | revision_id | enforcement | status | acquisition | raw | sha256 |",
        "|---|---|---|---|---|---|---|",
    ]
    for v in sorted(revs_ledger.values(), key=lambda x: x.get("law_id", "")):
        lines.append("| %s | %s | %s | %s | %s | %s | %s |" % (
            v.get("law_id", ""), v.get("law_revision_id", ""), v.get("enforcement_date", ""),
            v.get("revision_status", ""), v.get("acquisition_status", ""),
            v.get("raw_file", "-"), v.get("raw_sha256", "")[:16]))
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"acquired {ledger['count_acquired']}/{ledger['count_total']} recorded")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
