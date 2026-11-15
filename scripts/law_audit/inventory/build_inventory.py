#!/usr/bin/env python3
"""Phase A: build the target-regulation ledger (data/INVENTORY.json).

Enumerates tax-related *national* laws from the official e-Gov law lists
(https://laws.e-gov.go.jp/api/1/lawlists/1) and pins, for each surviving
candidate:

  - law_id / law_num / promulgation_date  (from lawlist XML + revisions API)
  - law_title                             (from selected revision)
  - the current revision effective as of 2026-11-15
    (prefer revision_info.current_revision_status == "CurrentEnforced";
     if absent, the latest revision whose amendment_enforcement_date <= today
     and whose status is not "UnEnforced"; otherwise unresolved -> status)
  - enforcement/amendment metadata and raw download status (SHA-256 for pinned
    law_data snapshots)

Local tax ordinances (地方税条例) are NOT national laws and are NOT included in
the national list.  They are managed as independent per-municipality legal
sources; see data/INVENTORY.json notes and docs/METHODOLOGY.md.

The script is resumable: HTTP results are cached under build/inventory_cache/
and reused without network access.  Raw JSON snapshots are stored under
data/raw/ when --raw is passed for the requested law_ids.
"""
from __future__ import annotations

import argparse
import datetime as _dt
import hashlib
import json
import sys
import time
import urllib.request
import xml.etree.ElementTree as ET
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
LIST_XML = REPO_ROOT / "scripts" / "law_audit" / "inventory" / "lawlists_1.xml"
CACHE_DIR = REPO_ROOT / "build" / "inventory_cache"
RAW_DIR = REPO_ROOT / "data" / "raw"
OUT_JSON = REPO_ROOT / "data" / "INVENTORY.json"

API_V2 = "https://laws.e-gov.go.jp/api/2"
REVISIONS_URL = API_V2 + "/law_revisions/{law_id}"
LAW_DATA_URL = API_V2 + "/law_data/{law_revision_id}"
LAW_PAGE = "https://laws.e-gov.go.jp/law/{law_id}"
SNAPSHOT_DATE = "2026-11-15"
TODAY = _dt.date(2026, 11, 15)

# Core statutes named in the mission as 主要対象 plus their primary 施行令 /
# 施行規則, and other tax-imposition acts named there.  These are *starting
# priorities*, not trusted complete lists: the full candidate population is
# enumerated from the official lists below.
CORE_IDS = [
    # 所得税
    "340AC0000000033", "340CO0000000096",
    # 法人税
    "340AC0000000034", "340CO0000000097",
    # 消費税
    "363AC0000000108", "363CO0000000360",
    # 相続税
    "325AC0000000073", "325CO0000000071",
    # 地方税
    "325AC0000000226", "325CO0000000245",
    # 国税通則
    "337AC0000000066",
    # 国税徴収
    "334AC0000000147",
    # 租税特別措置
    "332AC0000000026", "332CO0000000043",
    # 関税・関税定率法・暫定措置法
    "329AC0000000061", "143AC0000000054", "335AC0000000036",
    # 印紙税・登録免許税
    "342AC0000000023", "342AC0000000035",
    # 地方法人税・国際観光旅客税
    "426AC0000000011", "430AC0000000016",
    # 個別間接税
    "328AC0000000006", "359AC0000000072", "353AC0000000025",
    "349AC0000000079", "332AC0000000055", "330AC0000000104",
    "403AC0000000069", "325AC0000000211",
]
CORE_NAME_FALLBACK = {}


def cache_path(url: str, suffix: str) -> Path:
    key = hashlib.sha256(url.encode("utf-8")).hexdigest()
    return CACHE_DIR / f"{key}.{suffix}"


def http_get_bytes(url: str, retries: int = 4, delay: float = 1.0) -> bytes:
    cache = cache_path(url, "json")
    if cache.exists():
        return cache.read_bytes()
    last_exc: Exception | None = None
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(url, timeout=60) as resp:
                data = resp.read()
            cache.parent.mkdir(parents=True, exist_ok=True)
            cache.write_bytes(data)
            return data
        except Exception as exc:  # noqa: BLE001 - any network failure is recorded by caller
            last_exc = exc
            time.sleep(delay * (attempt + 1))
    raise RuntimeError(f"fetch failed after {retries} attempts: {url}: {last_exc}")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def parse_lawlist() -> list[dict]:
    root = ET.parse(LIST_XML).getroot()
    out = []
    for e in root.findall(".//LawNameListInfo"):
        out.append(
            {
                "law_id": (e.findtext("LawId") or "").strip(),
                "law_name": (e.findtext("LawName") or "").strip(),
                "law_num": (e.findtext("LawNo") or "").strip(),
                "promulgation_date": (e.findtext("PromulgationDate") or "").strip(),
            }
        )
    return out


def select_revision(revisions: list[dict]) -> tuple[dict | None, str]:
    """Pick the applicable revision as of TODAY.

    Returns (revision_dict_or_None, selection_status) where selection_status is
    one of:  current_enforced / historical_fallback / fully_unenforced / none.
    """
    enforced = [r for r in revisions if r.get("current_revision_status") == "CurrentEnforced"]
    if enforced:
        # There should be exactly one; if several, prefer the latest
        # amendment_enforcement_date (defensive) and record the count.
        enforced.sort(key=lambda r: (r.get("amendment_enforcement_date") or ""), reverse=True)
        r = enforced[0]
        return (r, "current_enforced" if len(enforced) == 1 else f"current_enforced_ambiguous_{len(enforced)}")

    cand: list[dict] = []
    for r in revisions:
        eff = r.get("amendment_enforcement_date") or ""
        status = r.get("current_revision_status") or ""
        if eff and eff <= TODAY.isoformat() and status != "UnEnforced":
            cand.append(r)
    if cand:
        cand.sort(key=lambda r: r.get("amendment_enforcement_date") or "", reverse=True)
        return cand[0], "historical_fallback"

    unenforced = [r for r in revisions if r.get("current_revision_status") == "UnEnforced"]
    if unenforced:
        return None, "fully_unenforced"
    if revisions:
        return None, "status_unknown"
    return None, "empty"


def build_entry(list_entry: dict, fetch_raw: bool) -> dict:
    lid = list_entry["law_id"]
    rec: dict = {
        "law_id": lid,
        "law_num": list_entry["law_num"],
        "official_title": list_entry["law_name"],
        "promulgation_date": list_entry["promulgation_date"],
        "law_page": LAW_PAGE.format(law_id=lid),
        "category": "tax_national",
        "phase": "A",
    }
    try:
        data = http_get_bytes(REVISIONS_URL.format(law_id=lid))
        rec["revisions_fetch"] = "ok"
        rec["revisions_sha256"] = sha256_bytes(data)
        rec["revisions_size_bytes"] = len(data)
    except RuntimeError as exc:
        rec["revisions_fetch"] = f"failed: {exc}"
        rec["current_revision"] = None
        rec["audit_ready"] = False
        rec["current_revision_status"] = "fetch_failed"
        return rec

    try:
        payload = json.loads(data)
    except json.JSONDecodeError as exc:
        rec["revisions_fetch"] = f"invalid_json: {exc}"
        rec["current_revision"] = None
        rec["audit_ready"] = False
        rec["current_revision_status"] = "fetch_failed"
        return rec

    info = payload.get("law_info") or {}
    rec["law_type"] = info.get("law_type")
    revs = payload.get("revisions") or []
    selected, selection_status = select_revision(revs)
    rec["selection_status"] = selection_status

    if selected is not None:
        rev_id = selected.get("law_revision_id")
        rec["law_type"] = selected.get("law_type") or rec["law_type"]
        rec["current_revision"] = {
            "law_revision_id": rev_id,
            "law_title": selected.get("law_title") or list_entry["law_name"],
            "current_revision_status": selected.get("current_revision_status"),
            "amendment_enforcement_date": selected.get("amendment_enforcement_date"),
            "amendment_enforcement_comment": selected.get("amendment_enforcement_comment"),
            "amendment_promulgate_date": selected.get("amendment_promulgate_date"),
            "amendment_law_id": selected.get("amendment_law_id"),
            "amendment_law_title": selected.get("amendment_law_title"),
            "amendment_law_num": selected.get("amendment_law_num"),
            "amendment_type": selected.get("amendment_type"),
            "mission": selected.get("mission"),
            "updated": selected.get("updated"),
        }
        rec["current_revision_status"] = selected.get("current_revision_status") or selection_status
        if fetch_raw:
            rev_id = selected.get("law_revision_id")
            dest = RAW_DIR / f"{rev_id}.law.json"
            try:
                if dest.exists():
                    raw = dest.read_bytes()
                    reused = True
                else:
                    raw = http_get_bytes(LAW_DATA_URL.format(law_revision_id=rev_id))
                    RAW_DIR.mkdir(parents=True, exist_ok=True)
                    dest.write_bytes(raw)
                    reused = False
                RAW_DIR.mkdir(parents=True, exist_ok=True)
                rec["raw_snapshot"] = {
                    "source_file": f"data/raw/{dest.name}",
                    "source_url": LAW_DATA_URL.format(law_revision_id=rev_id),
                    "source_sha256": sha256_bytes(raw),
                    "size_bytes": len(raw),
                    "reused_existing_cache": reused,
                }
                rec["audit_ready"] = len(raw) > 0
            except RuntimeError as exc:
                rec["raw_snapshot"] = None
                rec["raw_fetch_error"] = str(exc)
                rec["audit_ready"] = False
        else:
            rec["raw_snapshot"] = None
            rec["audit_ready"] = False
    else:
        rec["current_revision"] = None
        rec["current_revision_status"] = selection_status
        rec["audit_ready"] = False
        if fetch_raw:
            rec["raw_snapshot"] = None
    # Only a CurrentEnforced revision may be audit-ready. Anything else is
    # registered but NOT ready to audit (and must never be counted as verified).
    if (
        rec.get("current_revision_status") != "CurrentEnforced"
        or selection_status not in ("current_enforced", "current_enforced_ambiguous_2")
    ):
        if rec.get("current_revision") is not None:
            rec["audit_ready"] = False
            rec["audit_note"] = (
                "current_revision_status is not CurrentEnforced; registered for "
                "tracking only, not audit-ready."
            )
    return rec


def load_candidates() -> list[dict]:
    entries = parse_lawlist()
    seen = set()
    cand = []
    for e in entries:
        lid = e["law_id"]
        if "税" not in e["law_name"]:
            continue
        if lid in seen:
            continue
        seen.add(lid)
        cand.append(e)
    # Deterministic order: by promulgation date then law_id.
    cand.sort(key=lambda e: (e["promulgation_date"], e["law_id"]))
    return cand


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--out", type=Path, default=OUT_JSON)
    ap.add_argument("--fetch-raw", action="store_true",
                    help="fetch and hash law_data snapshots (large); default is revisions-only")
    ap.add_argument("--raw-core-only", action="store_true",
                    help="with --fetch-raw, fetch raw snapshots only for the core set")
    ap.add_argument("--limit", type=int, default=None, help="debug: process first N candidates")
    args = ap.parse_args()

    sys.stdout.reconfigure(encoding="utf-8")

    candidates = load_candidates()
    if args.limit is not None:
        candidates = candidates[: args.limit]
    core = set(CORE_IDS)
    missing_core = sorted(core - {c["law_id"] for c in candidates})

    print(f"candidates: {len(candidates)} (tax-keyword filter)")
    print(f"core set:   {len(core)} ids; not found in candidates: {missing_core}")

    records = []
    for i, e in enumerate(candidates, 1):
        fetch_raw = args.fetch_raw and (not args.raw_core_only or e["law_id"] in core)
        rec = build_entry(e, fetch_raw=fetch_raw)
        records.append(rec)
        st = rec.get("current_revision_status")
        cr = (rec.get("current_revision") or {}).get("law_revision_id") or "-"
        print(f"[{i:3}/{len(candidates)}] {e['law_id']} {st:24} {cr}")

    fetched = sum(1 for r in records if r.get("revisions_fetch") == "ok")
    ok_rev = sum(1 for r in records if r.get("current_revision"))
    ok_raw = sum(1 for r in records if r.get("raw_snapshot"))
    summary = {
        "snapshot_date": SNAPSHOT_DATE,
        "source_lawlist": "https://laws.e-gov.go.jp/api/1/lawlists/1 (scripts/law_audit/inventory/lawlists_1.xml)",
        "candidate_filter": "law_name contains '税'",
        "candidate_count": len(candidates),
        "revisions_fetched_ok": fetched,
        "current_revision_resolved": ok_rev,
        "raw_snapshots_fetched": ok_raw,
        "failed": [r["law_id"] for r in records if r.get("revisions_fetch") != "ok"],
        "unresolved": [
            {"law_id": r["law_id"], "status": r.get("current_revision_status")}
            for r in records if not r.get("current_revision")
        ],
        "notes": [
            "Candidates enumerated deterministically from the official national law list by the '税' keyword in the law name.",
            "Local tax ordinances (地方税条例) are independent per-municipality law sources and are NOT in the national list; they are tracked separately as unsupported-scope until per-municipality enumeration is implemented.",
            "租税条約・通達・裁判例 are interpretive-auxiliary layers, not target statutes in Phase A.",
            "raw_snapshot is null unless --fetch-raw was passed; L4/L5 audit targets require raw snapshots.",
            "A revision whose enforcement date is after 2026-11-15 or whose status is UnEnforced is treated as not-yet-in-effect and is not audit-ready.",
        ],
    }

    inventory = {"snapshot_date": SNAPSHOT_DATE, "summary": summary, "laws": records}
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(inventory, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"\nwrote {args.out} ({args.out.stat().st_size} bytes)")
    print(f"revisions ok={fetched}  resolved={ok_rev}  raw={ok_raw}  failed={len(summary['failed'])}  unresolved={len(summary['unresolved'])}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
