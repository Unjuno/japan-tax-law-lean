#!/usr/bin/env python3
"""Resolve discovered reference names to official e-Gov law IDs (Objective §2).

`recursive_discovery.py` scans pinned snapshots for 「〈law name〉第N条」 and
reports names absent from the 327-law '税' keyword ledger. This module adds the
missing step: it parses the FULL national law list (`lawlists_1.xml`) and
resolves those names to official law IDs, so related statutes whose names do
NOT contain 「税」 are collected as explicit candidates.

Resolved names are recorded, NOT added to INVENTORY automatically (that needs
an official revision + SHA-256 snapshot) and NOT counted as acquired, parsed,
modelled, proved or reviewed. Historical/amended-version references remain a
separate layer.

Run: python scripts/law_audit/inventory/recursive_discovery_resolve.py
"""
from __future__ import annotations

import json
import re
import sys
import xml.etree.ElementTree as ET
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
LAWLIST = REPO / "scripts" / "law_audit" / "inventory" / "lawlists_1.xml"
OUT_JSON = REPO / "data" / "RECURSIVE_DISCOVERY_RESOLVED.json"
OUT_MD = REPO / "docs" / "RECURSIVE_DISCOVERY_RESOLVED.md"

NAME_RE = re.compile(
    r"([\u4e00-\u9fffA-Za-z0-9]{2,40}?(?:施行令|施行規則|法律|法|令|規則))\s*"
    r"第[一二三四五六七八九十百〇0-9]+条"
)
# Era-prefixed law-number headings, e.g. 昭和二十五年法律第二百二十六号（地方税法）
ERA_PREFIX = re.compile(
    r"^(?:明治|大正|昭和|平成|令和)[一二三四五六七八九十百〇0-9]+年"
    r"(?:法律|政令|省令|規則|勅令|太政官布告)[第〇一二三四五六七八九十百0-9]+号"
)
GENERIC = {
    "この法律", "本法", "同法", "当該法律", "他の法律", "関係法律",
    "この政令", "同政令", "当該政令", "この省令", "同省令",
}


def norm(s: str) -> str:
    return re.sub(r"[\s\u3000]+", "", str(s)).strip()


def short_name(name: str) -> str:
    """Strip an era-law-number heading and unwrap the trailing （title）."""
    s = norm(name)
    m = ERA_PREFIX.match(s)
    if m:
        s = s[m.end():]
    m = re.match(r"^（(.+)）$", s)
    if m:
        s = m.group(1)
    return s or norm(name)


def load_lawlist(path: Path) -> list[dict[str, str]]:
    root = ET.parse(path).getroot()
    out = []
    for info in root.iter("LawNameListInfo"):
        lid = (info.findtext("LawId") or "").strip()
        name = (info.findtext("LawName") or "").strip()
        if lid and name:
            out.append({"law_id": lid, "law_name": name, "law_no": (info.findtext("LawNo") or "").strip()})
    return out


def build_index(entries: list[dict[str, str]]):
    exact: dict[str, str] = {}
    short: dict[str, str] = {}
    by_no: dict[str, str] = {}
    for e in entries:
        exact.setdefault(norm(e["law_name"]), e["law_id"])
        short.setdefault(norm(short_name(e["law_name"])), e["law_id"])
        if e["law_no"]:
            by_no.setdefault(norm(e["law_no"]), e["law_id"])
    return exact, short, by_no


def resolve_name(ref: str, exact: dict[str, str], short: dict[str, str], by_no: dict[str, str]):
    """Return (law_id, method) or (None, 'unresolved')."""
    r = norm(ref)
    if r in exact:
        return exact[r], "exact_law_name"
    s = norm(short_name(ref))
    if s in short:
        return short[s], "short_law_name"
    if s in by_no:
        return by_no[s], "law_number"
    # A shared prefix is NOT evidence of identity: it can map an Act name to
    # its ministerial ordinance (or vice versa). Such references stay
    # unresolved unless an explicit alias/identifying token is recorded.
    return None, "unresolved"


def scan_references() -> Counter[str]:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    titles = {norm(l.get("official_title", "")) for l in inv.get("laws", []) if l.get("official_title")}
    names: Counter[str] = Counter()
    scanned = 0
    for rec in inv.get("laws", []):
        sf = (rec.get("raw_snapshot") or {}).get("source_file")
        if not sf:
            continue
        p = REPO / sf
        if not p.exists():
            continue
        try:
            doc = json.loads(p.read_text(encoding="utf-8"))
        except Exception:
            continue
        scanned += 1
        text = norm(_flat(doc.get("law_full_text")))
        for m in NAME_RE.finditer(text):
            name = m.group(1)
            if norm(name) in GENERIC or norm(short_name(name)) in GENERIC:
                continue
            if norm(name) in titles or norm(short_name(name)) in titles:
                continue
            names[name] += 1
    return names


def _flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(_flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(_flat(c) for c in node)
    return ""


def build():
    names = scan_references()
    entries = load_lawlist(LAWLIST)
    exact, short, by_no = build_index(entries)
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    led_ids = {str(l["law_id"]) for l in inv.get("laws", [])}

    id_to_title = {e["law_id"]: e["law_name"] for e in entries}
    resolved_new: dict[str, dict] = {}
    alias: dict[str, dict] = {}
    unresolved: list[dict] = []
    for name, count in names.items():
        lid, method = resolve_name(name, exact, short, by_no)
        row = {"name": name, "occurrences": count, "law_id": lid, "method": method,
               "contains_tax_keyword": "税" in name}
        if lid is None:
            unresolved.append(row)
        elif lid in led_ids:
            alias[norm(name)] = row
        else:
            # Group every reference name under its law id; never overwrite an
            # earlier name/occurrence count with a later one.
            group = resolved_new.setdefault(lid, {
                "law_id": lid,
                "official_title": id_to_title.get(lid, ""),
                "total_occurrences": 0,
                "contains_tax_keyword": False,
                "reference_names": [],
            })
            group["total_occurrences"] += count
            group["contains_tax_keyword"] = group["contains_tax_keyword"] or ("税" in name)
            group["reference_names"].append({"name": name, "occurrences": count, "method": method})

    for group in resolved_new.values():
        group["reference_names"].sort(key=lambda r: (-r["occurrences"], r["name"]))
    new_sorted = sorted(resolved_new.values(),
                        key=lambda r: (-r["total_occurrences"], str(r["law_id"])))
    alias_sorted = sorted(alias.values(), key=lambda r: (-r["occurrences"], r["name"]))
    unresolved_sorted = sorted(unresolved, key=lambda r: (-r["occurrences"], r["name"]))

    payload = {
        "tool": "scripts/law_audit/inventory/recursive_discovery_resolve.py",
        "snapshot_date": inv.get("snapshot_date", ""),
        "full_law_list_entries": len(entries),
        "ledger_laws": len(inv.get("laws", [])),
        "unmatched_reference_names": len(names),
        "resolved_new_law_ids": len(new_sorted),
        "resolved_ledger_aliases": len(alias_sorted),
        "unresolved_names": len(unresolved_sorted),
        "new_law_candidates": new_sorted,
        "ledger_name_aliases": alias_sorted,
        "unresolved": unresolved_sorted,
        "claim": "discovery only; not acquired, not parsed, not modelled, not reviewed",
    }
    json_text = json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True)

    lines = [
        "# Recursive discovery — resolution to official law IDs (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/law_audit/inventory/recursive_discovery_resolve.py`.",
        "",
        "Objective §2: reference / delegation / amendment relations are explored",
        "recursively, including related laws whose names do NOT contain 「税」.",
        "Names are resolved against the FULL e-Gov national law list, not only",
        "against the 327-law '税' keyword ledger.",
        "",
        "All entries are DISCOVERED-CANDIDATES. They are NOT added to INVENTORY,",
        "NOT acquired, NOT parsed, NOT modelled, NOT proved and NOT reviewed.",
        "Historical / unenforced revisions remain a separate layer.",
        "",
        f"- snapshot date: {inv.get('snapshot_date', '')}",
        f"- full law-list entries: {len(entries)}",
        f"- ledger laws: {len(inv.get('laws', []))}",
        f"- unmatched reference names scanned: {len(names)}",
        f"- resolved to NEW official law ids: {len(new_sorted)}",
        f"- resolved as aliases of laws already in ledger: {len(alias_sorted)}",
        f"- unresolved names: {len(unresolved_sorted)}",
        "",
        "## New law-id candidates (not in ledger)",
        "",
        "Reference names are grouped under their law id; occurrences are summed",
        "across all names. Exact / short-title / law-number matches only — a",
        "shared prefix is never treated as identity.",
        "",
        "| law_id | official title | occurrences | names | contains 税 |",
        "|---|---|---:|---:|:--:|",
    ]
    for r in new_sorted:
        lines.append(f"| `{r['law_id']}` | {r['official_title']} | {r['total_occurrences']} | "
                     f"{len(r['reference_names'])} | "
                     f"{'YES' if r['contains_tax_keyword'] else 'NO'} |")
    lines += [
        "",
        "## Ledger name aliases (already acquired under another title)",
        "",
        "| name | law_id | occurrences | method |",
        "|---|---|---:|---|",
    ]
    for r in alias_sorted:
        lines.append(f"| {r['name']} | `{r['law_id']}` | {r['occurrences']} | {r['method']} |")
    lines += [
        "",
        "## Unresolved names (kept as uncertainty, not silently dropped)",
        "",
        "| name | occurrences |",
        "|---|---:|",
    ]
    for r in unresolved_sorted[:100]:
        lines.append(f"| {r['name']} | {r['occurrences']} |")
    lines.append("")
    return json_text, "\n".join(lines)


def main() -> int:
    json_text, md_text = build()
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    json_same = OUT_JSON.exists() and OUT_JSON.read_text(encoding="utf-8") == json_text
    md_same = OUT_MD.exists() and OUT_MD.read_text(encoding="utf-8") == md_text
    if json_same and md_same:
        print("recursive discovery resolution matches committed state (deterministic)")
        return 0
    OUT_JSON.write_text(json_text, encoding="utf-8")
    OUT_MD.write_text(md_text, encoding="utf-8")
    print("wrote", OUT_JSON, "and", OUT_MD)
    return 1


if __name__ == "__main__":
    sys.exit(main())
