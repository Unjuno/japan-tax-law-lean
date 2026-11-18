#!/usr/bin/env python3
"""Recursive target-law discovery (Objective §1).

Scans the pinned raw snapshots of every ledger law for references of the form
「〈law name〉第N条」 and compares the extracted law names against the ledger's
official_title set. Names that do not match are reported as DISCOVERED-CANDIDATE
entries: they are NOT silently added to the ledger (that requires fetching the
official snapshot and revision from e-Gov), and they are NOT counted as
verified. This is a discovery aid, not a completion claim.
"""
from __future__ import annotations

import json
import re
import sys
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
OUT = REPO / "docs" / "RECURSIVE_DISCOVERY.md"
OUT_TMP = REPO / "build" / "recursive_discovery.md"

# Japanese law names ending in 法/令/規則 that precede an article reference.
NAME_RE = re.compile(r"([\u4e00-\u9fffA-Za-z0-9]{2,40}?(?:施行令|施行規則|法律|法|令|規則))\s*第[一二三四五六七八九十百〇0-9]+条")


def flat(node):
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    return ""


def build() -> str:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    titles = {l.get("official_title", "") for l in laws if l.get("official_title")}
    names: Counter[str] = Counter()
    scanned = 0
    for rec in laws:
        sf = (rec.get("raw_snapshot") or {}).get("source_file")
        if not sf:
            continue
        p = REPO / sf
        if not p.exists():
            continue
        try:
            d = json.loads(p.read_text(encoding="utf-8"))
        except Exception:
            continue
        scanned += 1
        text = re.sub(r"[\s\u3000]+", "", flat(d.get("law_full_text")))
        for m in NAME_RE.finditer(text):
            name = m.group(1)
            if name in titles:
                continue
            names[name] += 1

    lines = [
        "# Recursive target-law discovery (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/law_audit/inventory/recursive_discovery.py`.",
        "",
        "Objective §1 requires discovering target laws from reference, delegation and",
        "application relations rather than a name keyword alone. This scanner extracts",
        "law names that precede an article reference in every pinned raw snapshot and",
        "reports names not present in the ledger's official_title set.",
        "",
        "DISCOVERED-CANDIDATE entries are NOT added to INVENTORY automatically: adding a",
        "law requires fetching its official revision and SHA-256 snapshot from e-Gov.",
        "They are NOT counted as acquired, parsed, modelled or reviewed.",
        "",
        f"laws in ledger: {len(laws)}",
        f"raw snapshots scanned: {scanned}",
        f"distinct unmatched reference names: {len(names)}",
        f"total unmatched reference occurrences: {sum(names.values())}",
        "",
    ]
    # Priority subset: names containing 税 are the most likely in-scope tax laws.
    tax_names = [(n, c) for n, c in names.items() if "税" in n]
    tax_names.sort(key=lambda x: (-x[1], x[0]))
    historical = [(n, c) for n, c in tax_names if "新" in n or "旧" in n]
    historical.sort(key=lambda x: (-x[1], x[0]))
    lines += [
        "## Historical-version references (Phase F: amendment impact)",
        "",
        f"tax-name candidates prefixed '新' or '旧': {len(historical)} names / "
        f"{sum(c for _, c in historical)} occurrences",
        "",
        "These are references to historical/amended versions of laws already in the",
        "ledger, found in 附則・経過措置. They are NOT new target laws. Verifying",
        "amendment impact (Phase F) requires pinning those historical revisions to",
        "e-Gov snapshots, which is NOT DONE. They are NOT counted as verified.",
        "",
        "| count | name |",
        "|---:|---|",
    ]
    for name, count in historical[:20]:
        lines.append(f"| {count} | {name} |")
    lines += [
        "",
        f"## Tax-name candidates (contain '税', not in ledger) — {len(tax_names)} names",
        "",
        "These are the highest-priority DISCOVERED-CANDIDATE entries for sponsor review:",
        "names containing '税' that precede an article reference but are not in INVENTORY.",
        "They are NOT added automatically and NOT counted as verified or acquired.",
        "",
        "| count | name |",
        "|---:|---|",
    ]
    for name, count in tax_names[:80]:
        lines.append(f"| {count} | {name} |")
    lines += [
        "",
        "## All unmatched reference names (top 60 by frequency)",
        "",
        "| count | name |",
        "|---:|---|",
    ]
    for name, count in names.most_common(60):
        lines.append(f"| {count} | {name} |")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    text = build()
    OUT_TMP.parent.mkdir(parents=True, exist_ok=True)
    OUT_TMP.write_text(text, encoding="utf-8")
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("recursive discovery ledger matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
