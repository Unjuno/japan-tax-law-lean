#!/usr/bin/env python3
"""Resolve recursively discovered reference names against the official law list.

The 327-law inventory is only a provisional population: the selection rule uses
the keyword 税. This ledger cross-references every unmatched name discovered in
the pinned raw snapshots against the committed e-Gov law list (lawlists_1.xml),
so related statutes whose title lacks 税 are no longer invisible.

Nothing here is added to INVENTORY or counted as acquired/verified. Local
ordinances, treaties and interpretive sources are reported in separate layers.
"""
from __future__ import annotations

import json
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
NAMES = REPO / "build" / "discovered_names.json"
LAWLIST = REPO / "scripts" / "law_audit" / "inventory" / "lawlists_1.xml"
OUT_JSON = REPO / "build" / "discovered_laws.json"
OUT_MD = REPO / "docs" / "DISCOVERED_LAWS.md"

_WS = re.compile(r"[\s\u3000]+")


def norm(t: str) -> str:
    return _WS.sub("", str(t or ""))


def load_lawlist() -> dict[str, dict]:
    root = ET.parse(LAWLIST).getroot()
    index: dict[str, dict] = {}
    for info in root.iter("LawNameListInfo"):
        name = norm(info.findtext("LawName", ""))
        lid = norm(info.findtext("LawId", ""))
        if name and lid:
            index.setdefault(name, {"law_id": lid,
                                    "law_no": norm(info.findtext("LawNo", "")),
                                    "law_type": norm(info.findtext("LawType", ""))})
    return index


def classify(name: str, occurrences: int, lawlist: dict[str, dict],
             inventory_titles: set[str]) -> dict:
    n = norm(name)
    layer = "NATIONAL_STATUTE"
    resolution = "UNRESOLVED"
    law_id = ""
    note = ""
    if "条約" in n:
        layer = "TREATY_LAYER"
        note = "treaty_not_a_domestic_statute"
    elif "通達" in n or "判例" in n or "裁判例" in n:
        layer = "INTERPRETIVE_LAYER"
        note = "not_a_statute"
    elif "条例" in n or re.search(r"(都|道|府|県|市|町|村).*税", n):
        layer = "LOCAL_ORDINANCE_LAYER"
        note = "municipality_level_not_in_national_list"

    base = n[1:] if n[:1] in ("新", "旧") else n
    historical = n != base
    if historical and (base in lawlist or base in inventory_titles):
        resolution = "HISTORICAL_VERSION"
        law_id = lawlist.get(base, {}).get("law_id", "")
        note = note or "amended_version_reference_needs_separate_enforcement_pin"
    elif n in lawlist:
        resolution = "RESOLVED_IN_LAWLIST"
        law_id = lawlist[n]["law_id"]
    elif base in lawlist:
        resolution = "RESOLVED_IN_LAWLIST"
        law_id = lawlist[base]["law_id"]
        note = note or "matched_after_historical_prefix_removal"
    elif layer == "NATIONAL_STATUTE":
        note = "title_not_found_in_official_law_list"

    return {
        "name": name,
        "occurrences": occurrences,
        "category": "TAX_NAME" if "税" in n else "NON_TAX_NAME",
        "layer": layer,
        "resolution": resolution,
        "law_id": law_id,
        "in_inventory": law_id in inventory_titles,
        "note": note,
    }


def build() -> dict:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    inventory_titles = {norm(l.get("official_title", "")) for l in inv.get("laws", [])}
    inventory_ids = {l.get("law_id", "") for l in inv.get("laws", [])}
    discovered = json.loads(NAMES.read_text(encoding="utf-8")) if NAMES.exists() else {"names": {}}
    lawlist = load_lawlist()
    entries = [classify(n, c, lawlist, inventory_titles)
               for n, c in discovered.get("names", {}).items()]
    entries.sort(key=lambda e: (-e["occurrences"], e["name"]))
    for e in entries:
        e["in_inventory"] = e["law_id"] in inventory_ids
    return {
        "tool": "scripts/law_audit/inventory/discovery_ledger.py",
        "inventory_snapshot_date": inv.get("snapshot_date", ""),
        "lawlist_entries": len(lawlist),
        "discovered_names": len(entries),
        "resolved_in_lawlist": sum(1 for e in entries if e["resolution"] == "RESOLVED_IN_LAWLIST"),
        "resolved_non_tax": sum(1 for e in entries if e["resolution"] == "RESOLVED_IN_LAWLIST"
                                and e["category"] == "NON_TAX_NAME"),
        "historical_versions": sum(1 for e in entries if e["resolution"] == "HISTORICAL_VERSION"),
        "unresolved": sum(1 for e in entries if e["resolution"] == "UNRESOLVED"),
        "local_ordinance_mentions": sum(1 for e in entries if e["layer"] == "LOCAL_ORDINANCE_LAYER"),
        "treaty_mentions": sum(1 for e in entries if e["layer"] == "TREATY_LAYER"),
        "interpretive_mentions": sum(1 for e in entries if e["layer"] == "INTERPRETIVE_LAYER"),
        "entries": entries,
    }


def report(payload: dict) -> str:
    lines = [
        "# Discovered target-law ledger (machine-generated)",
        "",
        "Do not hand-edit. Regenerate: `python scripts/law_audit/inventory/discovery_ledger.py`.",
        "",
        "The 327-law keyword inventory is provisional. Names discovered from",
        "references in the pinned snapshots are resolved against the committed",
        "e-Gov law list, including statutes whose title does NOT contain 税.",
        "Resolved names are CANDIDATES: no raw snapshot, revision or proof is",
        "implied, and nothing is added to INVENTORY automatically.",
        "",
        f"- snapshot: {payload['inventory_snapshot_date']}",
        f"- official law-list entries: {payload['lawlist_entries']}",
        f"- discovered distinct names: {payload['discovered_names']}",
        f"- resolved in official law list: {payload['resolved_in_lawlist']}",
        f"- resolved non-税 statutes: {payload['resolved_non_tax']}",
        f"- historical-version references: {payload['historical_versions']}",
        f"- unresolved names: {payload['unresolved']}",
        f"- local-ordinance mentions (separate layer): {payload['local_ordinance_mentions']}",
        f"- treaty mentions (separate layer): {payload['treaty_mentions']}",
        f"- interpretive-source mentions (separate layer): {payload['interpretive_mentions']}",
        "",
        "## Resolved related statutes whose title lacks 税 (top 60)",
        "",
        "| occurrences | name | law_id |",
        "|---:|---|---|",
    ]
    non_tax = [e for e in payload["entries"] if e["category"] == "NON_TAX_NAME"
               and e["resolution"] == "RESOLVED_IN_LAWLIST"]
    for e in non_tax[:60]:
        lines.append(f"| {e['occurrences']} | {e['name']} | `{e['law_id']}` |")
    lines += [
        "",
        "## Still unresolved (top 40)",
        "",
        "| occurrences | name | layer |",
        "|---:|---|---|",
    ]
    for e in [x for x in payload["entries"] if x["resolution"] == "UNRESOLVED"][:40]:
        lines.append(f"| {e['occurrences']} | {e['name']} | {e['layer']} |")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    payload = build()
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, sort_keys=True,
                                   separators=(",", ":")), encoding="utf-8")
    text = report(payload)
    OUT_MD.write_text(text, encoding="utf-8")
    print(f"discovery ledger: {payload['discovered_names']} names, "
          f"{payload['resolved_in_lawlist']} resolved "
          f"({payload['resolved_non_tax']} non-tax), {payload['unresolved']} unresolved")
    return 0


if __name__ == "__main__":
    sys.exit(main())
