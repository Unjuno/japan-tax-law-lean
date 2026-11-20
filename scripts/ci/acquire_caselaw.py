#!/usr/bin/env python3
"""Pin real court case-law pages as a separate L5 denominator (§2).

Case law is NOT a statutory source: these pages are pinned only as auxiliary
material for adversarial/counterexample review. Nothing here is parsed,
formalized, proved, treated as binding, or legally reviewed.

The adapter:
  1. queries the Supreme Court public case-law search (courts.go.jp) for a tax
     keyword, pins the result page and records its hit count;
  2. extracts real judgment-detail links from that page, fetches a small number,
     and validates each as a genuine judgment page (title + 事件番号 + 裁判年月日);
  3. writes SHA-256-pinned bytes under data/raw_caselaw/ and a ledger.

Usage:
  python scripts/ci/acquire_caselaw.py --limit 2
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import ssl
import urllib.parse
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
RAW_DIR = REPO / "data" / "raw_caselaw"
OUT = REPO / "data" / "CASELAW_PINNED.json"
OUT_MD = REPO / "docs" / "CASELAW_PINNED.md"
SEARCH = "https://www.courts.go.jp/hanrei/search1/index.html"
KEYWORD = "租税"
ERROR_TITLE = "指定されたページ"


def tls_context():
    try:
        import certifi
        return ssl.create_default_context(cafile=certifi.where())
    except Exception:
        return ssl.create_default_context()


def fetch(url: str) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0 (case-law pinning)"})
    with urllib.request.urlopen(req, timeout=40, context=tls_context()) as r:
        return r.read()


def valid_judgment(body: bytes) -> bool:
    text = body.decode("utf-8", errors="replace")
    if len(body) < 20000 or ERROR_TITLE in text:
        return False
    title = re.search(r"<title[^>]*>(.*?)</title>", text, re.S | re.I)
    return bool(title and "裁判例結果詳細" in title.group(1)
                and "事件番号" in text and "裁判年月日" in text)


def pin(url: str, name: str, validator) -> dict | None:
    try:
        body = fetch(url)
    except Exception as exc:
        return {"url": url, "raw_file": "", "raw_sha256": "", "raw_bytes": 0,
                "acquisition_status": "FETCH_FAILED", "note": str(exc)[:300]}
    if not validator(body):
        return {"url": url, "raw_file": "", "raw_sha256": "", "raw_bytes": len(body),
                "acquisition_status": "NOT_JUDGMENT_PAGE"}
    RAW_DIR.mkdir(parents=True, exist_ok=True)
    dest = RAW_DIR / name
    if dest.exists():
        # Resumable: dynamic pages change between fetches. The already-pinned
        # bytes are reused only if they still pass the content validator.
        on_disk = dest.read_bytes()
        if not validator(on_disk):
            return {"url": url, "raw_file": "", "raw_sha256": "", "raw_bytes": len(on_disk),
                    "acquisition_status": "ON_DISK_CONTENT_INVALID"}
    else:
        dest.write_bytes(body)
        on_disk = dest.read_bytes()
        if hashlib.sha256(on_disk).digest() != hashlib.sha256(body).digest():
            return {"url": url, "raw_file": "", "raw_sha256": "", "raw_bytes": len(body),
                    "acquisition_status": "SNAPSHOT_HASH_MISMATCH"}
    return {"url": url, "raw_file": str(dest.relative_to(REPO)).replace("\\", "/"),
            "raw_sha256": hashlib.sha256(on_disk).hexdigest(), "raw_bytes": len(on_disk),
            "acquisition_status": "ACQUIRED_PINNED"}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=2)
    args = ap.parse_args()
    ledger = {
        "tool": "scripts/ci/acquire_caselaw.py",
        "claim": "case-law HTML pages pinned only as auxiliary material; "
                 "not parsed, formalized, proved, binding or legally reviewed; "
                 "separate L5 denominator",
        "verification_status": "OUT_OF_SCOPE",
        "authority": "裁判所 (courts.go.jp) 裁判例検索",
        "search_keyword": KEYWORD,
        "index": {},
        "judgments": [],
    }
    query_url = SEARCH + "?" + urllib.parse.urlencode({"query1": KEYWORD, "query2": ""})
    idx = pin(query_url, "search1_租税.html",
              lambda b: len(b) > 100000 and "裁判例検索" in b.decode("utf-8", errors="replace"))
    ledger["index"] = idx or {}
    if idx and idx.get("acquisition_status") == "ACQUIRED_PINNED":
        text = (RAW_DIR / idx["raw_file"].split("/")[-1]).read_bytes().decode("utf-8", errors="replace")
        m = re.search(r"([\d,]+)件", text)
        ledger["index"]["reported_hit_count"] = m.group(1) if m else "unknown"
        all_links = re.findall(r'href=["\']([^"\']+)["\']', text, re.I)
        seen = set()
        for href in all_links:
            if len(ledger["judgments"]) >= args.limit:
                break
            m = re.search(r'(?:\./)?\.\./(\d+)/(detail\d+)/index\.html', href, re.I)
            if not m:
                continue
            case_id, detail = m.group(1), m.group(2)
            if case_id in seen:
                continue
            seen.add(case_id)
            url = f"https://www.courts.go.jp/hanrei/{case_id}/{detail}/index.html"
            rec = pin(url, f"{case_id}_{detail}.html", valid_judgment)
            if rec:
                rec["case_id"] = case_id
                ledger["judgments"].append(rec)
    ledger["count_acquired"] = sum(
        1 for r in ([ledger["index"]] if ledger["index"] else []) + ledger["judgments"]
        if r.get("acquisition_status") == "ACQUIRED_PINNED")
    OUT.write_text(json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    lines = [
        "# Case-law pages pinned (machine-generated)", "",
        "Do not hand-edit. Regenerate with `scripts/ci/acquire_caselaw.py`.", "",
        "Objective §2: case law is an AUXILIARY layer, not a statutory source.",
        "These pages are pinned only — NOT parsed, formalized, proved, treated as",
        "binding, or legally reviewed.", "",
        f"- search keyword: {KEYWORD}",
        f"- reported hits: {ledger['index'].get('reported_hit_count', 'unknown')}",
        f"- ACQUIRED_PINNED pages: {ledger['count_acquired']}",
        f"- verification_status: {ledger['verification_status']}", "",
        "| kind | url | bytes | sha256 | status |", "|---|---|---:|---|---|",
    ]
    rows = []
    if ledger["index"]:
        rows.append(("index", ledger["index"]))
    rows += [("judgment", r) for r in ledger["judgments"]]
    for kind, r in rows:
        lines.append("| %s | %s | %d | %s | %s |" % (
            kind, r.get("url", ""), r.get("raw_bytes", 0),
            r.get("raw_sha256", "")[:16], r.get("acquisition_status", "")))
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"acquired {ledger['count_acquired']} pages "
          f"({len(ledger['judgments'])} judgments)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
