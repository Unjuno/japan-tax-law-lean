#!/usr/bin/env python3
"""Acquire the recursive-discovery candidates as a SEPARATE source layer.

Objective §2: the 327-law '税' keyword ledger is provisional. This script pins
the current enforced revision and SHA-256 raw snapshot for laws discovered
through reference / delegation / amendment relations (including laws whose
names do not contain 「税」), without modifying INVENTORY.json. Acquired laws
are added to data/DISCOVERED_INVENTORY.json and are NOT counted as parsed,
formalized or proved. Historical references and unenforced revisions stay in
their own status categories.

Resumable: HTTP responses are cached by build_inventory.http_get_bytes, and
already acquired records are skipped. Regenerate docs with this script.

Usage:
  python scripts/law_audit/inventory/acquire_discovered.py --limit 12
"""
from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import build_inventory as bi  # noqa: E402

REPO = HERE.parents[2]
DISCOVERY = REPO / "data" / "RECURSIVE_DISCOVERY_RESOLVED.json"
OUT = REPO / "data" / "DISCOVERED_INVENTORY.json"
OUT_MD = REPO / "docs" / "DISCOVERED_SCOPE.md"
SNAPSHOT_DATE = "2026-11-15"


def load_json(path: Path, default: dict) -> dict:
    if not path.exists():
        return default
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        return data if isinstance(data, dict) else default
    except (ValueError, OSError):
        return default


def candidates() -> list[dict]:
    disc = load_json(DISCOVERY, {})
    out = list(disc.get("new_law_candidates") or [])
    out.sort(key=lambda x: (-int(x.get("occurrences") or 0), str(x.get("law_id", ""))))
    return out


def acquire_one(c: dict) -> dict:
    lid = str(c["law_id"])
    rec = {
        "law_id": lid,
        "discovered_name": c.get("name", ""),
        "occurrences": c.get("occurrences", 0),
        "contains_tax_keyword": bool(c.get("contains_tax_keyword")),
        "source": "recursive_discovery",
        "snapshot_date": SNAPSHOT_DATE,
        "acquisition_status": "UNKNOWN",
        "source_file": "",
        "source_sha256": "",
        "revision": "",
        "enforcement_date": "",
        "official_title": "",
        "note": "",
    }
    try:
        data = bi.http_get_bytes(bi.REVISIONS_URL.format(law_id=lid))
    except Exception as exc:  # noqa: BLE001 - network failure is a recorded status
        rec["acquisition_status"] = "FETCH_FAILED"
        rec["note"] = str(exc)[:300]
        return rec
    try:
        payload = json.loads(data)
    except ValueError as exc:
        rec["acquisition_status"] = "INVALID_JSON"
        rec["note"] = str(exc)[:300]
        return rec

    revs = payload.get("revisions") or []
    selected, selection_status = bi.select_revision(revs)
    rec["revisions_sha256"] = hashlib.sha256(data).hexdigest().upper()
    rec["selection_status"] = selection_status
    if selected is None:
        rec["acquisition_status"] = ("FULLY_UNENFORCED" if selection_status == "fully_unenforced"
                                     else "NO_ENFORCED_REVISION")
        rec["note"] = "revision exists but no enforced snapshot as of " + SNAPSHOT_DATE
        return rec

    rev_id = str(selected.get("law_revision_id") or "")
    rec["revision"] = rev_id
    rec["enforcement_date"] = str(selected.get("amendment_enforcement_date") or "")
    rec["official_title"] = str(selected.get("law_title") or c.get("name", ""))
    if not rev_id:
        rec["acquisition_status"] = "REVISION_ID_MISSING"
        return rec

    dest = bi.RAW_DIR / f"{rev_id}.law.json"
    try:
        raw = bi.http_get_bytes(bi.LAW_DATA_URL.format(law_revision_id=rev_id))
    except Exception as exc:  # noqa: BLE001
        rec["acquisition_status"] = "SNAPSHOT_FETCH_FAILED"
        rec["note"] = str(exc)[:300]
        return rec
    if not dest.exists():
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(raw)
    # Verify the on-disk snapshot actually matches what was fetched.
    on_disk = dest.read_bytes()
    if hashlib.sha256(on_disk).digest() != hashlib.sha256(raw).digest():
        rec["acquisition_status"] = "SNAPSHOT_HASH_MISMATCH"
        return rec
    rec["source_file"] = str(dest.relative_to(REPO)).replace("\\", "/")
    rec["source_sha256"] = hashlib.sha256(on_disk).hexdigest().upper()
    rec["size_bytes"] = len(on_disk)
    rec["acquisition_status"] = "ACQUIRED"
    return rec


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=12)
    args = ap.parse_args()

    ledger = load_json(OUT, {
        "claim": "discovered source layer; acquired/pinned only, not parsed or proved",
        "snapshot_date": SNAPSHOT_DATE,
        "laws": {},
    })
    laws = ledger.setdefault("laws", {})
    todo = [c for c in candidates() if str(c["law_id"]) not in laws][:args.limit]
    for c in todo:
        laws[str(c["law_id"])] = acquire_one(c)
    ledger["laws_total_discovered"] = len(candidates())
    ledger["laws_acquired_total"] = sum(
        1 for r in laws.values() if r.get("acquisition_status") == "ACQUIRED")
    ledger["laws_recorded"] = len(laws)

    OUT.write_text(json.dumps(ledger, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n",
                   encoding="utf-8")

    statuses: dict[str, int] = {}
    for r in laws.values():
        s = r.get("acquisition_status", "UNKNOWN")
        statuses[s] = statuses.get(s, 0) + 1
    lines = [
        "# Discovered-scope acquisition (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/inventory/acquire_discovered.py`.",
        "",
        "Objective §2: these laws were found through reference / delegation / amendment",
        "relations and are a SEPARATE source layer. They are NOT in the 327-law tax",
        "ledger, are NOT parsed, formalized, proved or legally reviewed.",
        "",
        f"- snapshot date: {SNAPSHOT_DATE}",
        f"- discovered new law ids: {ledger['laws_total_discovered']}",
        f"- recorded in this run: {len(laws)}",
        f"- ACQUIRED (revision + SHA-256 snapshot pinned): {ledger['laws_acquired_total']}",
        "",
        "| status | count |",
        "|---|---:|",
    ]
    lines += [f"| {k} | {v} |" for k, v in sorted(statuses.items())]
    lines += [
        "",
        "| law_id | discovered name | title | enforcement | status | snapshot |",
        "|---|---|---|---|---|---|",
    ]
    for r in sorted(laws.values(), key=lambda x: -int(x.get("occurrences") or 0)):
        lines.append(
            f"| `{r['law_id']}` | {r.get('discovered_name','')} | {r.get('official_title','')} | "
            f"{r.get('enforcement_date','')} | {r.get('acquisition_status','')} | "
            f"{r.get('source_file','') or '-'} |")
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")

    print(f"acquired {ledger['laws_acquired_total']}/{len(laws)} recorded; "
          f"discovered total {ledger['laws_total_discovered']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
