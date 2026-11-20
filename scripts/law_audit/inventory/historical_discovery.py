#!/usr/bin/env python3
"""Historical-reference classification (Objective §2, §6).

The pinned inventory distinguishes current, historical, unenforced, unacquired
and unobtainable sources. This tool classifies the 新/旧 (and 元年旧) names found
in 附則・経過措置 into those categories, WITHOUT inventing snapshots or treating
a historical reference as a current law.

Classification:
  HISTORICAL_OF_LEDGER_LAW   base name matches a current ledger title; its
                             historical revision is NOT pinned here
  UNENFORCED_LEDGER_LAW      the only matching ledger law is fully unenforced
  UNMATCHED_HISTORICAL_NAME  no ledger title matches; recorded, never dropped
Acquisition status for every row is `NOT_PINNED` / `NOT_ACQUIRED`; the tool does
not claim "unobtainable" (取得不能) without an actual failed fetch record.

Regenerate with `python scripts/law_audit/inventory/historical_discovery.py`.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
DISCOVERY = REPO / "docs" / "RECURSIVE_DISCOVERY.md"
OUT_JSON = REPO / "data" / "HISTORICAL_DISCOVERY.json"
OUT_MD = REPO / "docs" / "HISTORICAL_DISCOVERY.md"

PREFIX_RE = re.compile(r"^(?:元年)?(?:新|旧|旧効力)(.+)")
ROW_RE = re.compile(r"^\|\s*(\d+)\s*\|\s*([^|]+?)\s*\|\s*$")


def norm(s: str) -> str:
    return re.sub(r"[\s\u3000]+", "", s or "")


def parse_historical_section(text: str) -> list[dict]:
    """Parse only the historical-version table, not the tax-name tables."""
    lines = text.splitlines()
    start = next((i for i, l in enumerate(lines)
                  if "Historical-version references" in l), None)
    if start is None:
        return []
    rows = []
    in_table = False
    for line in lines[start:]:
        if line.startswith("## ") and rows:
            break
        if line.startswith("| count |"):
            in_table = True
            continue
        if not in_table:
            continue
        m = ROW_RE.match(line)
        if m:
            rows.append({"count": int(m.group(1)), "name": norm(m.group(2))})
        elif rows and line.startswith("|"):
            continue
        elif rows:
            break
    return rows


def classify(rows: list[dict], inventory: dict) -> dict:
    titles = {norm(l.get("official_title", "")): l for l in inventory.get("laws", [])}
    unenforced = {norm(l.get("official_title", "")) for l in inventory.get("laws", [])
                  if (l.get("current_revision") or {}).get("status") == "fully_unenforced"}
    counted = {}
    for r in rows:
        name = r["name"]
        m = PREFIX_RE.match(name)
        base = norm(m.group(1)) if m else ""
        counted.setdefault(name, {"name": name, "occurrences": 0, "base": base})
        counted[name]["occurrences"] += r["count"]

    out = []
    for rec in counted.values():
        name, base = rec["name"], rec["base"]
        law = titles.get(base)
        if law and norm(base) in unenforced:
            cls = "UNENFORCED_LEDGER_LAW"
        elif law:
            cls = "HISTORICAL_OF_LEDGER_LAW"
        else:
            cls = "UNMATCHED_HISTORICAL_NAME"
        out.append({
            "name": name,
            "base_name": base,
            "occurrences": rec["occurrences"],
            "class": cls,
            "matched_law_id": law.get("law_id", "") if law else "",
            "acquisition_status": "NOT_PINNED",
            "snapshot_pinned": False,
            "verification_status": "OUT_OF_SCOPE",
        })
    out.sort(key=lambda r: (-r["occurrences"], r["name"]))
    return {
        "tool": "scripts/law_audit/inventory/historical_discovery.py",
        "schema": 1,
        "inventory_snapshot": inventory.get("snapshot_date", ""),
        "rule": "historical revisions are recorded, never treated as current enforced versions; no snapshot is fabricated",
        "names": out,
        "totals": {
            "distinct_names": len(out),
            "occurrences": sum(r["occurrences"] for r in out),
            "by_class": {c: sum(1 for r in out if r["class"] == c)
                         for c in ("HISTORICAL_OF_LEDGER_LAW", "UNENFORCED_LEDGER_LAW",
                                   "UNMATCHED_HISTORICAL_NAME")},
        },
    }


def build() -> dict:
    text = DISCOVERY.read_text(encoding="utf-8")
    payload = classify(parse_historical_section(text),
                       json.loads(INVENTORY.read_text(encoding="utf-8")))
    m = re.search(r"tax-name candidates prefixed.*?:\s*(\d+)\s*names\s*/\s*(\d+)\s*occurrences", text)
    payload["reported_by_recursive_discovery"] = {
        "names": int(m.group(1)) if m else None,
        "occurrences": int(m.group(2)) if m else None,
        "note": "RECURSIVE_DISCOVERY.md reports these totals; the table lists only the highest-frequency names, so the classified rows above are a subset.",
    }
    return payload


def main() -> int:
    payload = build()
    text = json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    if OUT_JSON.exists() and OUT_JSON.read_text(encoding="utf-8") == text:
        print("historical discovery ledger matches committed state (deterministic)")
    else:
        OUT_JSON.write_text(text, encoding="utf-8")
        print("wrote", OUT_JSON)
    t = payload["totals"]
    lines = [
        "# Historical reference classification (machine-generated)", "",
        "Do not hand-edit. Regenerate with `python scripts/law_audit/inventory/historical_discovery.py`.",
        "",
        "Historical (新/旧) names in 附則・経過措置 are recorded separately and",
        "are NEVER treated as current enforced versions. No snapshot is pinned",
        "for them, so none is counted as acquired or verified.", "",
        f"- distinct names in the published table: {t['distinct_names']}",
        f"- occurrences in the published table: {t['occurrences']}",
        "- reported by recursive discovery (all names, table is top-frequency only): "
        + str(payload["reported_by_recursive_discovery"]),
    ]
    for k, v in t["by_class"].items():
        lines.append(f"- {k}: {v}")
    lines += ["", "| name | base | occurrences | class | pinned |", "|---|---|---:|---|---|"]
    for r in payload["names"][:80]:
        lines.append("| %s | %s | %d | %s | no |" % (
            r["name"], r["base_name"] or "-", r["occurrences"], r["class"]))
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print("names:", t["distinct_names"], "occurrences:", t["occurrences"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
