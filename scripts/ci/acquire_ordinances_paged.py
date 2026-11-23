#!/usr/bin/env python3
"""Pin official municipal tax-ordinance pages as a separate L2 denominator.

Paginates the Doshisha 条例Webアーカイブ cross-municipality INDEX (third-party
academic aggregator — recorded as such, NOT an official original). Municipality
pages are fetched from official municipal `original_url` values, validated as
substantial 市税条例 pages, and pinned with SHA-256 under data/raw_ordinances/.

Nothing here is parsed, formalized, proved or legally reviewed. The index hit
count is NOT an acquisition count. Coverage of all municipalities is NOT claimed.

Usage:
  python scripts/ci/acquire_ordinances_paged.py --limit 60 --max-pages 20
"""
from __future__ import annotations
import argparse, hashlib, json, ssl, urllib.parse, urllib.request
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


def get(url, accept="*/*"):
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0 (ordinance pinning)", "Accept": accept})
    with urllib.request.urlopen(req, timeout=60, context=tls_context()) as r:
        return r.read()


def pin_bytes(body, dest, url, extra):
    RAW_DIR.mkdir(parents=True, exist_ok=True)
    if dest.exists():
        on_disk = dest.read_bytes()
    else:
        dest.write_bytes(body)
        on_disk = dest.read_bytes()
    if hashlib.sha256(on_disk).hexdigest() != hashlib.sha256(body).hexdigest():
        return {"url": url, "acquisition_status": "SNAPSHOT_HASH_MISMATCH", **extra}
    return {"url": url, "raw_file": str(dest.relative_to(REPO)).replace("\\", "/"),
            "raw_sha256": hashlib.sha256(on_disk).hexdigest(), "raw_bytes": len(on_disk),
            "acquisition_status": "ACQUIRED_PINNED", **extra}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=60)
    ap.add_argument("--max-pages", type=int, default=20)
    args = ap.parse_args()
    ledger = {
        "tool": "scripts/ci/acquire_ordinances_paged.py",
        "claim": "official municipal tax-ordinance pages pinned only as a separate L2 "
                 "denominator; not parsed, formalized, proved or legally reviewed; "
                 "coverage of all municipalities NOT claimed",
        "verification_status": "OUT_OF_SCOPE",
        "index_source": "Doshisha 条例Webアーカイブ (third-party academic aggregator, NOT an official original)",
        "query": QUERY,
        "index": {}, "ordinances": [],
    }
    index_pages = []
    seen_cities = set()
    numfound = None
    for page in range(args.max_pages):
        url = API + "?" + urllib.parse.urlencode({"q": QUERY, "rows": 200, "start": page * 200})
        try:
            body = get(url, "application/json")
            payload = json.loads(body)
            resp = payload.get("response", {})
            numfound = resp.get("numFound", numfound)
            docs = resp.get("docs", [])
            index_pages.append({"url": url, "page": page, "docs": len(docs),
                                "raw_sha256": hashlib.sha256(body).hexdigest(),
                                "raw_bytes": len(body), "acquisition_status": "ACQUIRED_PINNED"})
        except Exception as exc:
            index_pages.append({"url": url, "page": page, "acquisition_status": "FETCH_FAILED",
                                "note": str(exc)[:200]})
            continue
        if not docs:
            break
        for d in docs:
            if len(ledger["ordinances"]) >= args.limit:
                break
            pref = str(d.get("prefecture") or "")
            city = str(d.get("city") or "")
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
        if len(ledger["ordinances"]) >= args.limit:
            break
    ledger["index"] = {"pages": index_pages, "reported_numFound": numfound,
                       "unique_cities_seen": len(seen_cities),
                       "source_type": "third_party_aggregator_index (paginated)"}
    ledger["count_index_hits"] = numfound
    ledger["count_acquired"] = sum(1 for r in ledger["ordinances"]
                                   if r.get("acquisition_status") == "ACQUIRED_PINNED")
    OUT.write_text(json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    lines = ["# Local ordinances pinned (machine-generated)", "",
             "Do not hand-edit. Regenerate with `scripts/ci/acquire_ordinances_paged.py`.", "",
             "Objective §2: local tax ordinances are a SEPARATE denominator. The index is a",
             "third-party academic aggregator (NOT an official original); the pinned ordinance",
             "pages come from official municipal sites. Pinned only — NOT parsed, formalized,",
             "proved or legally reviewed. No all-municipality coverage claimed.", "",
             f"- query: {QUERY}; index reported hits: {numfound}",
             f"- index pages fetched: {len(index_pages)}; unique cities seen: {len(seen_cities)}",
             f"- ACQUIRED_PINNED official ordinance pages: {ledger['count_acquired']}",
             f"- verification_status: {ledger['verification_status']}", "",
             "| prefecture | city | bytes | sha256 | status |", "|---|---|---:|---|---|"]
    for r in ledger["ordinances"]:
        lines.append("| %s | %s | %d | %s | %s |" % (
            r.get("prefecture", ""), r.get("city", ""), r.get("raw_bytes", 0),
            r.get("raw_sha256", "")[:16], r.get("acquisition_status", "")))
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"acquired {ledger['count_acquired']} official ordinance pages "
          f"(index hits {numfound}, pages {len(index_pages)}, cities seen {len(seen_cities)})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
