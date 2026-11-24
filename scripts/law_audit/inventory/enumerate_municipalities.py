#!/usr/bin/env python3
"""Enumerate local-tax-ordinance jurisdictions from the official 総務省 code list.

Source: 総務省「都道府県コード及び市区町村コード」(公式 PDF on soumu.go.jp).
This script downloads that PDF, extracts rows and records each jurisdiction as
a SEPARATE source layer with explicit NOT_ACQUIRED status. It does NOT fetch
ordinance text, does NOT add anything to INVENTORY.json and does NOT claim any
formalization or legal review. Only the enumeration of jurisdictions is claimed.

Usage: python scripts/law_audit/inventory/enumerate_municipalities.py
"""
from __future__ import annotations

import hashlib
import io
import json
import re
import sys
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
SOURCE_URL = "https://www.soumu.go.jp/main_content/000925834.pdf"
OUT = REPO / "data" / "LOCAL_JURISDICTIONS.json"
OUT_MD = REPO / "docs" / "LOCAL_ORDINANCE_ENUMERATION.md"
SNAPSHOT_DATE = "2026-11-15"

# Row shape in the official table: 6-digit code, prefecture kanji, municipality
# kanji (blank for prefecture rows), then kana columns.
ROW_RE = re.compile(
    r"^\s*(\d{6})\s+([^\s\t]+)\s+([^\s\t]*)\s+[^\s\t]*\s*[^\s\t]*\s*$")


def kind_of(name: str, code: str) -> str:
    if not name:
        return "PREFECTURE"
    if name.endswith("区"):
        return "WARD"
    if name.endswith("市"):
        return "CITY"
    if name.endswith("町"):
        return "TOWN"
    if name.endswith("村"):
        return "VILLAGE"
    return "OTHER"


def main() -> int:
    try:
        from pypdf import PdfReader
    except ImportError:
        print("pypdf is required: python -m pip install pypdf")
        return 2
    with urllib.request.urlopen(SOURCE_URL, timeout=120) as resp:
        raw = resp.read()
    reader = PdfReader(io.BytesIO(raw))
    text = "\n".join((page.extract_text() or "") for page in reader.pages)
    digest = hashlib.sha256(raw).hexdigest()

    rows: dict[str, dict] = {}
    for line in text.splitlines():
        m = ROW_RE.match(line)
        if m:
            code, pref, name = m.group(1), m.group(2), m.group(3)
        else:
            # Prefecture rows carry no municipality column: code, name, kana.
            parts = line.split()
            if len(parts) != 3 or not re.fullmatch(r"\d{6}", parts[0]):
                continue
            code, pref, name = parts[0], parts[1], ""
        if code in rows:
            continue
        rows[code] = {
            "code": code,
            "prefecture": pref,
            "municipality": name,
            "kind": kind_of(name, code),
            "layer": "L2_ORDINANCE",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": "ENUMERATED_JURISDICTION_ONLY",
            "note": "ordinance text not fetched; no law id, revision or proof",
        }
    counts: dict[str, int] = {}
    for r in rows.values():
        counts[r["kind"]] = counts.get(r["kind"], 0) + 1

    payload = {
        "claim": ("jurisdiction enumeration only; ordinance text NOT acquired, "
                  "NOT parsed, NOT proved, NOT legally reviewed"),
        "source_url": SOURCE_URL,
        "source_sha256": digest,
        "snapshot_date": SNAPSHOT_DATE,
        "jurisdictions_total": len(rows),
        "kind_counts": counts,
        "jurisdictions": rows,
    }
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")

    lines = [
        "# Local ordinance jurisdictions (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with "
        "`python scripts/law_audit/inventory/enumerate_municipalities.py`.",
        "",
        "Objective §2: local tax ordinances are independent per-municipality",
        "sources. This document enumerates the OFFICIAL jurisdiction codes only.",
        "Ordinance text, revisions, SHA-256 pins and proofs are NOT acquired.",
        "Nothing here is added to the national statute ledger.",
        "",
        f"- official source: {SOURCE_URL}",
        f"- source SHA-256: {digest}",
        f"- snapshot date: {SNAPSHOT_DATE}",
        f"- jurisdictions enumerated: {len(rows)}",
        "",
        "| kind | count | status |",
        "|---|---:|---|",
    ]
    lines += [f"| {k} | {v} | NOT_ACQUIRED |" for k, v in sorted(counts.items())]
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"enumerated {len(rows)} jurisdictions from the official code list; "
          f"kinds={counts}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
