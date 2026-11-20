#!/usr/bin/env python3
"""Pin real local tax ordinances as a separate L2 denominator (§2).

L2 ordinances are municipal law sources, NOT part of the 327-law national
ledger. This adapter:
  1. queries the Doshisha 条例Webアーカイブ cross-municipality INDEX (third-party
     academic aggregator — recorded as such, NOT an official original) for
     `title:市税条例`, and pins the JSON result with its reported hit count;
  2. takes official municipal `original_url` values from that index, fetches a
     small number, validates each as a substantial page containing 市税条例,
     and pins the raw bytes with SHA-256 under data/raw_ordinances/.

Nothing here is parsed, formalized, proved or legally reviewed. The index hit
count is NOT an acquisition count; only validated pinned pages are counted.
Coverage of all ~1,788 municipalities is NOT claimed.

Usage:
  python scripts/ci/acquire_ordinances.py --limit 4
"""
from __future__ import annotations

import argparse
import hashlib
import json
import ssl
import urllib.parse
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
RAW_DIR = REPO / "data" / "raw_ordinances"
OUT = REPO / "data" / "ORDINANCE_PINNED.json"
OUT_MD = REPO / "docs" / "ORDINANCE_PINNED.md"
API = "https://jorei.slis.doshisha.ac.jp/api/reiki/select"
QUERY = "title:市税条例"


def tls_context():
    try:
        import certifi
        return ssl.create_default_context(cafile=certifi.where())
    except Exception:
        return ssl.create_default_context()


def get(url: str, accept: str = "*/*") -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0 (ordinance pinning)",
                                                "Accept": accept})
    with urllib.request.urlopen(req, timeout=60, context=tls_context()) as r:
        return r.read()


def pin_bytes(body: bytes, dest: Path, url: str, extra: dict) -> dict:
    RAW_DIR.mkdir(parents=True, exist_ok=True)
    if dest.exists():
        on_disk = dest.read_bytes()
    else:
        dest.write_bytes(body)
        on_disk = dest.read_bytes()
    if hashlib.sha256(on_disk).digest() != hashlib.sha256(body).digest() and not dest.exists():
        return {"url": url, "acquisition_status": "SNAPSHOT_HASH_MISMATCH", **extra}
    return {"url": url, "raw_file": str(dest.relative_to(REPO)).replace("\\", "/"),
            "raw_sha256": hashlib.sha256(on_disk).hexdigest(), "raw_bytes": len(on_disk),
            "acquisition_status": "ACQUIRED_PINNED", **extra}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=4)
    args = ap.parse_args()
    ledger = {
        "tool": "scripts/ci/acquire_ordinances.py",
        "claim": "local tax ordinance pages pinned only as a separate L2 denominator; "
                 "not parsed, formalized, proved or legally reviewed; "
                 "coverage of all municipalities NOT claimed",
        "verification_status": "OUT_OF_SCOPE",
        "index_source": "Doshisha 条例Webアーカイブ (third-party academic aggregator, NOT an official original)",
        "query": QUERY,
        "index": {},
        "ordinances": [],
    }
    index_url = API + "?" + urllib.parse.urlencode({"q": QUERY, "rows": 200})
    try:
        body = get(index_url, "application/json")
        payload = json.loads(body)
        resp = payload.get("response", {})
        ledger["index"] = {
            "url": index_url, "source_type": "third_party_aggregator_index",
            "reported_numFound": resp.get("numFound"),
            "raw_sha256": hashlib.sha256(body).hexdigest(), "raw_bytes": len(body),
            "acquisition_status": "ACQUIRED_PINNED",
        }
        docs = resp.get("docs", [])
    except Exception as exc:
        ledger["index"] = {"url": index_url, "acquisition_status": "FETCH_FAILED",
                           "note": str(exc)[:300]}
        docs = []
    seen_cities = set()
    for d in docs:
        if len(ledger["ordinances"]) >= args.limit:
            break
        city = str(d.get("city") or "")
        pref = str(d.get("prefecture") or "")
        key = (pref, city)
        if key in seen_cities:
            continue
        seen_cities.add(key)
        ou = d.get("original_url")
        if isinstance(ou, list):
            ou = ou[0] if ou else None
        if not ou or not str(ou).startswith("http"):
            continue
        try:
            raw = get(str(ou))
        except Exception as exc:
            ledger["ordinances"].append({"url": str(ou), "prefecture": pref, "city": city,
                                         "acquisition_status": "FETCH_FAILED",
                                         "note": str(exc)[:200]})
            continue
        text = raw.decode("utf-8", errors="replace")
        if len(raw) < 100000 or "市税条例" not in text:
            ledger["ordinances"].append({"url": str(ou), "prefecture": pref, "city": city,
                                         "acquisition_status": "NOT_TAX_ORDINANCE",
                                         "raw_bytes": len(raw)})
            continue
        rid = str(d.get("id") or hashlib.sha256(str(ou).encode()).hexdigest()[:16])
        name = rid.replace("/", "_") + ".html"
        rec = pin_bytes(raw, RAW_DIR / name, str(ou),
                        {"prefecture": pref, "city": city, "record_id": rid,
                         "source_type": "official_municipal_site"})
        ledger["ordinances"].append(rec)
    ledger["count_index_hits"] = ledger["index"].get("reported_numFound")
    ledger["count_acquired"] = sum(
        1 for r in ledger["ordinances"] if r.get("acquisition_status") == "ACQUIRED_PINNED")
    OUT.write_text(json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    lines = [
        "# Local ordinances pinned (machine-generated)", "",
        "Do not hand-edit. Regenerate with `scripts/ci/acquire_ordinances.py`.", "",
        "Objective §2: local tax ordinances are a SEPARATE denominator. The index",
        "is a third-party academic aggregator (NOT an official original); the pinned",
        "ordinance pages come from official municipal sites. Pinned only — NOT parsed,",
        "formalized, proved or legally reviewed. No all-municipality coverage claimed.", "",
        f"- query: {QUERY}; index reported hits: {ledger['count_index_hits']}",
        f"- ACQUIRED_PINNED official ordinance pages: {ledger['count_acquired']}",
        f"- verification_status: {ledger['verification_status']}", "",
        "| prefecture | city | bytes | sha256 | status |", "|---|---|---:|---|---|",
    ]
    for r in ledger["ordinances"]:
        lines.append("| %s | %s | %d | %s | %s |" % (
            r.get("prefecture", ""), r.get("city", ""), r.get("raw_bytes", 0),
            r.get("raw_sha256", "")[:16], r.get("acquisition_status", "")))
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"acquired {ledger['count_acquired']} official ordinance pages "
          f"(index hits {ledger['count_index_hits']})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
