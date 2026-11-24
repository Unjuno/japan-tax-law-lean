#!/usr/bin/env python3
"""Local tax ordinance target ledger (Objective §2, separate legal-source layer).

The 327-law national inventory does NOT include 地方税条例, which each of Japan's
47 prefectures and 1,747 municipalities enacts independently. This ledger
establishes the target population at municipality granularity from the
authoritative MIC local-government code list committed in
data/local_governments.json.

Honesty: NOTHING here is acquired, parsed, formalized or verified. Every local
government's tax-ordinance status is NOT_ACQUIRED. National laws, treaties,
guidance and case law remain in their own layers and are never merged here.
"""
from __future__ import annotations

import hashlib
import json
import sys
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
SOURCE = REPO / "data" / "local_governments.json"
OUT_JSON = REPO / "build" / "local_ordinance_ledger.json"
OUT_MD = REPO / "docs" / "LOCAL_ORDINANCE_COVERAGE.md"

NOT_ACQUIRED = "NOT_ACQUIRED"


def build() -> dict:
    raw = SOURCE.read_bytes()
    doc = json.loads(raw.decode("utf-8"))
    prefs = doc["layers"]["prefectures"]
    muns = doc["layers"]["municipalities"]
    pref_by_code = {p["pref_code"]: p["pref_name"] for p in prefs}
    by_pref: dict[str, list] = {}
    for m in muns:
        by_pref.setdefault(m["pref_code"], []).append(m)
    entries = []
    for m in muns:
        code = m["code"]
        entries.append({
            "local_id": f"LOCAL-{code}",
            "code": code,
            "type": "municipality",
            "name": m["name"],
            "pref_code": m["pref_code"],
            "pref_name": pref_by_code.get(m["pref_code"], ""),
            "ordinance_layer": "LOCAL_TAX_ORDINANCE",
            "acquisition_status": NOT_ACQUIRED,
            "source_acquired": False,
            "sha256": "",
        })
    for p in prefs:
        entries.append({
            "local_id": f"LOCAL-{p['code']}",
            "code": p["code"],
            "type": "prefecture",
            "name": p["name"],
            "pref_code": p["pref_code"],
            "pref_name": p["pref_name"],
            "ordinance_layer": "LOCAL_TAX_ORDINANCE",
            "acquisition_status": NOT_ACQUIRED,
            "source_acquired": False,
            "sha256": "",
        })
    entries.sort(key=lambda e: (e["pref_code"], e["code"]))
    return {
        "tool": "scripts/law_audit/inventory/local_ordinance_ledger.py",
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "source_url": doc["source"],
        "layer": "LOCAL_TAX_ORDINANCE",
        "separate_from_national_inventory": True,
        "prefectures": len(prefs),
        "municipalities": len(muns),
        "local_governments_total": len(entries),
        "acquired": 0,
        "not_acquired": len(entries),
        "acquisition_coverage_pct": 0.0,
        "entries": entries,
    }


def report(payload: dict) -> str:
    counts = Counter(e["pref_name"] for e in payload["entries"])
    lines = [
        "# Local tax ordinance coverage (machine-generated)",
        "",
        "Do not hand-edit. Regenerate: "
        "`python scripts/law_audit/inventory/local_ordinance_ledger.py`.",
        "",
        "Objective §2 requires 地方税条例 to be collected per municipality. "
        "This ledger fixes the TARGET population at municipality granularity "
        "from the authoritative MIC local-government code list.",
        "",
        "NOTHING in this layer is acquired, parsed, formalized, proved or "
        "reviewed. It is separated from the 327-law national inventory, the "
        "treaty layer and the interpretive layer; no cross-layer counts are merged.",
        "",
        f"- source: {payload['source_url']}",
        f"- source sha256: `{payload['source_sha256']}`",
        f"- prefectures: {payload['prefectures']}",
        f"- municipalities: {payload['municipalities']}",
        f"- local governments total: {payload['local_governments_total']}",
        f"- acquired: {payload['acquired']}",
        f"- not acquired: {payload['not_acquired']}",
        f"- acquisition coverage: {payload['acquisition_coverage_pct']}%",
        "",
        "## Per-prefecture target counts (all NOT_ACQUIRED)",
        "",
        "| prefecture | local governments | acquired |",
        "|---|---:|---:|",
    ]
    for pref in sorted(counts):
        lines.append(f"| {pref} | {counts[pref]} | 0 |")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    payload = build()
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, sort_keys=True),
                        encoding="utf-8")
    OUT_MD.write_text(report(payload), encoding="utf-8")
    print(f"local ordinance ledger: {payload['local_governments_total']} targets, "
          f"0 acquired (separate layer)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
