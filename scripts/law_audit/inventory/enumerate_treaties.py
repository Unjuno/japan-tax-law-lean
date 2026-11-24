#!/usr/bin/env python3
"""Enumerate Japan's tax treaties from the official MOF list.

Source: 財務省「我が国の租税条約等の一覧」 (tax_convetion_list_jp.html).
This enumerates treaty/agreement PARTNERS and their declared type only. Treaty
texts are NOT fetched, NOT parsed, NOT modelled and NOT legally reviewed; the
layer is kept separate from national statutes (Objective §2).

Usage: python scripts/law_audit/inventory/enumerate_treaties.py
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
URL = "https://www.mof.go.jp/tax_policy/summary/international/tax_convention/tax_convetion_list_jp.html"
OUT = REPO / "data" / "TAX_TREATIES.json"
OUT_MD = REPO / "docs" / "TAX_TREATY_ENUMERATION.md"
SNAPSHOT = "2026-11-24"


def main() -> int:
    with urllib.request.urlopen(URL, timeout=120) as resp:
        raw = resp.read()
    html = raw.decode("utf-8", errors="replace")
    text = re.sub(r"<[^>]+>", "\n", html)
    lines = [re.sub(r"\s+", " ", x).strip() for x in text.splitlines()]
    lines = [x for x in lines if x]

    section = None
    entries: list[dict] = []
    skip = {"国・地域名", "条約名等", "署名日・発効日等（注１）", "署名日・発効日", "和文　英文", "-"}
    for i, line in enumerate(lines[:-1]):
        # The page repeats section labels in a quick-link menu earlier; only
        # the half-width "１. " / "２. " / "３. " forms mark the actual tables.
        if line.startswith("１. 租税条約"):
            section = "TAX_TREATY"
        elif line.startswith("２. 情報交換協定"):
            section = "INFORMATION_EXCHANGE"
        elif line.startswith("３. その他"):
            section = "OTHER"
        nxt = lines[i + 1]
        if section and line not in skip and (
                nxt.startswith("原条約") or nxt.startswith("原協定")
                or (section == "OTHER" and "署名日" in nxt)):
            if not re.match(r"^[一二三四五六七八九十アカサタナハマヤラワ]行", line):
                entries.append({
                    "name": line,
                    "layer": "L3_TREATY",
                    "kind": section,
                    "acquisition_status": "NOT_ACQUIRED",
                    "scope_status": "ENUMERATED_PARTNER_ONLY",
                    "note": "treaty text/revision/effect not acquired; interpretive layer, not a statute",
                })
    # de-duplicate by (name, kind)
    seen, uniq = set(), []
    for e in entries:
        k = (e["name"], e["kind"])
        if k not in seen:
            seen.add(k)
            uniq.append(e)
    counts: dict[str, int] = {}
    for e in uniq:
        counts[e["kind"]] = counts.get(e["kind"], 0) + 1
    payload = {
        "claim": "partner enumeration only; treaty text not acquired, not parsed, not proved, not legally reviewed",
        "source_url": URL,
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "snapshot_date": SNAPSHOT,
        "partners_total": len(uniq),
        "kind_counts": counts,
        "partners": uniq,
    }
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    lines_out = [
        "# Tax treaty partners (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/inventory/enumerate_treaties.py`.",
        "",
        "Objective §2: treaties are an auxiliary international-law layer, distinct from",
        "national statutes. Only partners and types are enumerated; treaty texts are NOT",
        "acquired, formalized, proved or legally reviewed.",
        "",
        f"- official source: {URL}",
        f"- source SHA-256: {payload['source_sha256']}",
        f"- snapshot date: {SNAPSHOT}",
        f"- partners enumerated: {len(uniq)}",
        "",
        "| kind | count | status |",
        "|---|---:|---|",
    ]
    lines_out += [f"| {k} | {v} | NOT_ACQUIRED |" for k, v in sorted(counts.items())]
    lines_out.append("")
    OUT_MD.write_text("\n".join(lines_out), encoding="utf-8")
    print(f"enumerated {len(uniq)} treaty partners; kinds={counts}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
