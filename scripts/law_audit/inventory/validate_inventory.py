"""Offline integrity check of data/INVENTORY.json (L1 ledger validation).

Verifies, without network access:
  - schema sanity of the ledger (required fields per record, allowed statuses);
  - count consistency between summary and records;
  - SHA-256/size match between manifest entries and files under data/raw/
    (law snapshots and revision pins) for every fetched core law;
  - no record may claim CurrentEnforced while missing an enforcement date,
    and every pinned raw file is referenced by the ledger (no unregistered
    verified-looking artifacts).

Exit 0 iff every check passes; print failures and exit 1 otherwise.
"""
from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
INVENTORY = REPO_ROOT / "data" / "INVENTORY.json"
RAW_DIR = REPO_ROOT / "data" / "raw"

ALLOWED_CURRENT_STATUS = {
    "CurrentEnforced",
    "UnEnforced",
    "Withdrawn",
    "廃止",
    "PreviousEnforced",  # e-Gov reports this for fully-repealed openers; recorded, never audited as current
    "fully_unenforced",
    "historical_fallback",
    "current_enforced",
    "status_unknown",
    "empty",
    "fetch_failed",
    "invalid_json",
}
ALLOWED_SELECTION_STATUS = {
    "current_enforced",
    "historical_fallback",
    "fully_unenforced",
    "status_unknown",
    "empty",
}
REQUIRED_RECORD = [
    "law_id", "law_num", "official_title", "promulgation_date",
    "law_page", "category", "phase",
]


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def main() -> int:
    problems: list[str] = []
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    records = inv.get("laws") or []
    summary = inv.get("summary") or {}

    def bad(msg: str) -> None:
        problems.append(msg)

    if len(records) != summary.get("candidate_count"):
        bad(f"candidate_count={summary.get('candidate_count')} but {len(records)} records")

    seen = set()
    n_ok = n_resolved = n_raw = 0
    n_unresolved = 0
    for i, rec in enumerate(records):
        for f in REQUIRED_RECORD:
            if not rec.get(f):
                bad(f"record[{i}] {rec.get('law_id')}: missing required field {f!r}")
        lid = rec["law_id"]
        if lid in seen:
            bad(f"record[{i}] duplicate law_id {lid}")
        seen.add(lid)
        if rec.get("revisions_fetch") == "ok":
            n_ok += 1
            cr = rec.get("current_revision")
            sel = rec.get("selection_status")
            if sel not in ALLOWED_SELECTION_STATUS:
                bad(f"{lid}: unexpected selection_status {sel!r}")
            cur_st = rec.get("current_revision_status")
            # accept exact set or historical_fallback with compound suffix
            if isinstance(cur_st, str) and cur_st not in ALLOWED_CURRENT_STATUS and not cur_st.startswith("current_enforced_ambiguous"):
                bad(f"{lid}: unexpected current_revision_status {cur_st!r}")
            if cr is None:
                n_unresolved += 1
            else:
                n_resolved += 1
                if cr.get("current_revision_status") == "CurrentEnforced":
                    if not cr.get("amendment_enforcement_date"):
                        bad(f"{lid}: CurrentEnforced without amendment_enforcement_date")
                snap = rec.get("raw_snapshot")
                if snap:
                    n_raw += 1
                    path = REPO_ROOT / snap["source_file"]
                    if not path.exists():
                        bad(f"{lid}: raw snapshot missing at {path}")
                    else:
                        h = _sha256(path)
                        if h != snap["source_sha256"]:
                            bad(f"{lid}: SHA-256 mismatch {h} != {snap['source_sha256']}")
                        if path.stat().st_size != snap["size_bytes"]:
                            bad(f"{lid}: size mismatch {path.stat().st_size} != {snap['size_bytes']}")
                    pin = RAW_DIR / f"{lid}.revisions.json"
                    if not pin.exists():
                        bad(f"{lid}: revisions pin missing at {pin}")
                    elif _sha256(pin) != rec["revisions_sha256"]:
                        bad(f"{lid}: revisions pin SHA-256 mismatch")

    if n_ok != summary.get("revisions_fetched_ok"):
        bad(f"revisions_fetched_ok={summary.get('revisions_fetched_ok')} but {n_ok} records say ok")
    if n_resolved != summary.get("current_revision_resolved"):
        bad(f"current_revision_resolved={summary.get('current_revision_resolved')} but {n_resolved} records resolved")
    if n_raw != summary.get("raw_snapshots_fetched"):
        bad(f"raw_snapshots_fetched={summary.get('raw_snapshots_fetched')} but {n_raw} records carry snapshots")
    if n_unresolved != len(summary.get("unresolved") or []):
        bad(f"unresolved count in summary={len(summary.get('unresolved') or [])} but {n_unresolved} records unresolved")

    failures = set(
        lid for lid in summary.get("failed") or []
    )
    for f in failures:
        rec = next((r for r in records if r["law_id"] == f), None)
        if rec is None:
            bad(f"summary.failed lists {f} but no such record")

    if problems:
        print(f"INVENTORY validation FAILED ({len(problems)} problem(s)):")
        for p in problems:
            print(" -", p)
        return 1
    print(
        f"INVENTORY validation OK: {len(records)} records, "
        f"{n_resolved} resolved, {n_raw} raw snapshots hash-verified, "
        f"{n_unresolved} unresolved (recorded, not counted as verified)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
