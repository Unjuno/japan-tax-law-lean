#!/usr/bin/env python3
"""Enumerate NTA circular families and auxiliary interpretive layers.

Official source: 国税庁「法令等」(https://www.nta.go.jp/law/). This records
category names and their legal nature only. Circular texts, revisions and
proofs are NOT acquired. Case law is NOT enumerated here (no authoritative
machine-readable official index was used) and stays explicitly UNENUMERATED.

Usage: python scripts/law_audit/inventory/enumerate_aux_layers.py
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
URL = "https://www.nta.go.jp/law/"
OUT = REPO / "data" / "AUXILIARY_SOURCES.json"
OUT_MD = REPO / "docs" / "AUXILIARY_SOURCES.md"
SNAPSHOT = "2026-11-24"


def main() -> int:
    with urllib.request.urlopen(URL, timeout=120) as resp:
        raw = resp.read()
    html = raw.decode("utf-8", errors="replace")
    text = re.sub(r"<[^>]+>", "\n", html)
    lines = [re.sub(r"\s+", " ", x).strip() for x in text.splitlines()]
    lines = [x for x in lines if x]

    entries: list[dict] = []
    # The NTA index has a category block "税目別の各種手続" following the
    # 法令解釈通達 description; split its slash-separated tax categories.
    start = next((i for i, x in enumerate(lines)
                  if x.startswith("税目別の各種手続") and "→" in x), None)
    if start is not None:
        for x in lines[start + 1:]:
            if x == "/" or not x or x.startswith("その他法令解釈"):
                if x.startswith("その他法令解釈"):
                    break
                continue
            if len(x) > 30 or "→" in x:
                break
            entries.append({
                "name": x, "kind": "CIRCULAR_FAMILY", "layer": "L4_CIRCULAR",
                "acquisition_status": "NOT_ACQUIRED",
                "scope_status": "ENUMERATED_CATEGORY_ONLY",
                "note": "administrative interpretation, not a statute; text not acquired",
            })
    families = ["事務運営指針", "国税庁告示", "文書回答事例", "質疑応答事例"]
    for f in families:
        if any(f in x for x in lines):
            entries.append({
                "name": f, "kind": "AUXILIARY_INFO", "layer": "L4_CIRCULAR",
                "acquisition_status": "NOT_ACQUIRED",
                "scope_status": "ENUMERATED_CATEGORY_ONLY",
                "note": "interpretive/administrative material; not a statute",
            })
    entries.append({
        "name": "裁判例", "kind": "CASE_LAW", "layer": "L5_CASELAW",
        "acquisition_status": "NOT_ACQUIRED", "scope_status": "UNENUMERATED",
        "note": "no authoritative machine-readable official index used; not a source of statute",
    })
    counts: dict[str, int] = {}
    for e in entries:
        counts[e["kind"]] = counts.get(e["kind"], 0) + 1
    payload = {
        "claim": "category enumeration only; no circular text, revision, proof or legal review acquired",
        "source_url": URL, "source_sha256": hashlib.sha256(raw).hexdigest(),
        "snapshot_date": SNAPSHOT, "entries_total": len(entries),
        "kind_counts": counts, "entries": entries,
    }
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    lines_out = [
        "# Auxiliary source layers (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/inventory/enumerate_aux_layers.py`.",
        "",
        "Objective §2: circulars and case law are interpretive/auxiliary layers,",
        "not statutes. Only categories are enumerated; texts are NOT acquired.",
        "",
        f"- official source: {URL}",
        f"- source SHA-256: {payload['source_sha256']}",
        f"- snapshot: {SNAPSHOT}",
        f"- entries: {len(entries)}",
        "",
        "| kind | count | status |", "|---|---:|---|",
    ]
    lines_out += [f"| {k} | {v} | NOT_ACQUIRED |" for k, v in sorted(counts.items())]
    lines_out.append("")
    OUT_MD.write_text("\n".join(lines_out), encoding="utf-8")
    print(f"enumerated {len(entries)} auxiliary entries; kinds={counts}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
