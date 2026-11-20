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
# 附則・経過措置の「新／旧＋法令名」は、別の未取得法令ではなく、
# 既知の法令の歴史的施行版への参照である。未解決として扱わず、
# 版ピン留めが必要な別層として記録する（Objective §2）。
HISTORICAL_PREFIX = ("改正前", "改正後", "新", "旧", "舊")


def historical_base(name: str) -> str:
    """Strip a historical-version prefix; return '' when none applies."""
    s = norm(name)
    for p in HISTORICAL_PREFIX:
        if s.startswith(p) and len(s) > len(p):
            return s[len(p):]
    return ""


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
    # A shared prefix is NOT identity evidence: it can map an Act to its
    # ministerial ordinance (or an enforcement order to its Act). Such names
    # stay unresolved unless an explicit alias/identifying token is recorded.
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
    new_name_rows: list[dict] = []
    alias: dict[str, dict] = {}
    historical: dict[str, dict] = {}
    unresolved: list[dict] = []
    for name, count in names.items():
        lid, method = resolve_name(name, exact, short, by_no)
        row = {"name": name, "occurrences": count, "law_id": lid, "method": method,
               "contains_tax_keyword": "税" in name}
        if lid is None:
            base = historical_base(name)
            base_id, base_method = (resolve_name(base, exact, short, by_no)
                                    if base else (None, "unresolved"))
            if base_id:
                historical[norm(name)] = {
                    "name": name,
                    "occurrences": count,
                    "base_law_id": base_id,
                    "base_name": base,
                    "base_resolution": base_method,
                    "historical_revision_pinned": False,
                    "requires_revision_pin": True,
                    "contains_tax_keyword": "税" in name,
                    "method": "historical_version_of_base",
                }
            else:
                unresolved.append(row)
        elif lid in led_ids:
            # Key by the raw discovered name: normalising collapses distinct
            # references (e.g. spacing variants) and undercounts the ledger.
            alias[name] = row
        else:
            # Group all reference names under one law id; never let a later
            # name silently overwrite an earlier name/occurrence count.
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
            new_name_rows.append(row)

    for group in resolved_new.values():
        group["reference_names"].sort(key=lambda r: (-r["occurrences"], r["name"]))
    historical_sorted = sorted(historical.values(),
                               key=lambda r: (-r["occurrences"], r["name"]))

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
        "resolved_new_names": len(new_name_rows),
        "resolved_ledger_aliases": len(alias_sorted),
        "historical_version_refs": len(historical_sorted),
        "historical_version_occurrences": sum(r["occurrences"] for r in historical_sorted),
        "unresolved_names": len(unresolved_sorted),
        "new_law_candidates": new_sorted,
        "ledger_name_aliases": alias_sorted,
        "historical_version_references": historical_sorted,
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
        f"- historical-version references (base law resolved, revision NOT pinned): "
        f"{len(historical_sorted)} names / "
        f"{sum(r['occurrences'] for r in historical_sorted)} occurrences",
        f"- unresolved names: {len(unresolved_sorted)}",
        "",
        "「新／旧＋法令名」は附則・経過措置における既知法令の歴史的施行版への参照であり、",
        "別の未取得法令ではない。ベース法令IDは解決済みだが、対応する施行版のスナップショットは",
        "固定されていない（`historical_revision_pinned=false`）。未取得・取得不能とも区別する。",
        "",
        "## Historical-version references (base resolved, revision not pinned)",
        "",
        "| name | occurrences | base law_id | base name | revision pinned |",
        "|---|---:|---|---|:--:|",
    ]
    for r in historical_sorted[:80]:
        lines.append(f"| {r['name']} | {r['occurrences']} | `{r['base_law_id']}` | "
                     f"{r['base_name']} | NO |")
    lines += [
        "",
        "## New law-id candidates (not in ledger)",
        "",
        "Reference names are grouped under one law id and occurrences are summed.",
        "Exact / short-title / law-number matches only; a shared prefix is never",
        "treated as identity (it can map an Act to its ministerial ordinance).",
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
