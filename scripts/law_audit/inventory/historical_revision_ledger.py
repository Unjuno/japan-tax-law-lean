#!/usr/bin/env python3
"""Historical revision pinning ledger (Objective §2, 2026-11-15 scope).

The 附則・経過措置 of pinned laws refer to historical versions (新/旧法) that
are NOT the current enforced revision. This ledger records every such reference
as an explicit obligation with status PIN_REQUIRED_NOT_DONE. It never claims a
historical snapshot was acquired, nor does it guess which revision a reference
denotes.

Source: build/discovered_laws.json (from recursive_discovery.py +
discovery_ledger.py), which is derived from pinned raw bytes.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
DISCOVERED = REPO / "build" / "discovered_laws.json"
PINS = REPO / "data" / "historical_revision_pins.json"
OUT_JSON = REPO / "build" / "historical_revisions.json"
OUT_MD = REPO / "docs" / "HISTORICAL_REVISIONS.md"
STATUS = "PIN_REQUIRED_NOT_DONE"


def main() -> int:
    d = json.loads(DISCOVERED.read_text(encoding="utf-8")) if DISCOVERED.exists() else {}
    hist = [e for e in d.get("entries", [])
            if e.get("resolution") == "HISTORICAL_VERSION"]
    pins = {}
    if PINS.exists():
        pd = json.loads(PINS.read_text(encoding="utf-8"))
        pins = {p["law_id"]: p for p in pd.get("laws", []) if p.get("law_id")}
    entries = []
    for e in sorted(hist, key=lambda x: (-x["occurrences"], x["name"])):
        p = pins.get(e.get("law_id", ""), {})
        cand = p.get("historical_candidates", [])
        entries.append({
            "reference_name": e["name"],
            "occurrences": e["occurrences"],
            "base_law_id": e.get("law_id", ""),
            "layer": "HISTORICAL_REVISION",
            "status": ("REVISION_METADATA_PINNED_SNAPSHOT_NOT_ACQUIRED"
                       if p.get("source_sha256") else STATUS),
            "pinned_revision_id": cand[0]["law_revision_id"] if cand else "",
            "historical_candidate_count": len(cand),
            "revision_list_sha256": p.get("source_sha256", ""),
            "raw_snapshot": "",
            "sha256": "",
            "note": "e-Gog API v2 revision metadata pinned; exact target revision and full law snapshot NOT acquired",
        })
    payload = {
        "tool": "scripts/law_audit/inventory/historical_revision_ledger.py",
        "snapshot_date": d.get("inventory_snapshot_date", ""),
        "historical_references": len(entries),
        "distinct_base_laws": len({e["base_law_id"] for e in entries if e["base_law_id"]}),
        "pinned": sum(1 for e in entries if e["pinned_revision_id"]),
        "not_pinned": sum(1 for e in entries if not e["pinned_revision_id"]),
        "revision_lists_pinned": sum(1 for p in pins.values() if p.get("source_sha256")),
        "historical_candidates_total": sum(len(p.get("historical_candidates", []))
                                           for p in pins.values()),
        "entries": entries,
    }
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, sort_keys=True),
                        encoding="utf-8")
    lines = [
        "# Historical revision pinning obligations (machine-generated)",
        "",
        "Do not hand-edit. Regenerate: "
        "`python scripts/law_audit/inventory/historical_revision_ledger.py`.",
        "",
        "Objective §2 requires historical references (新法/旧法 in 附則・経過措置) "
        "to be distinguished from unenforced and unobtained sources. Revision "
        "LIST metadata for the base laws was pinned from the e-Gov API v2 with "
        "SHA-256; candidate historical revision IDs and dates are recorded. "
        "NO historical law-data snapshot is acquired: the exact target revision "
        "still requires 附則 context and a separate law_data fetch.",
        "",
        f"- snapshot: {payload['snapshot_date']}",
        f"- historical references: {payload['historical_references']}",
        f"- distinct base laws: {payload['distinct_base_laws']}",
        f"- revision lists SHA-256 pinned: {payload['revision_lists_pinned']}",
        f"- historical revision candidates: {payload['historical_candidates_total']}",
        f"- references with a pinned candidate ID: {payload['pinned']}",
        f"- references without: {payload['not_pinned']}",
        "",
        "| reference | occurrences | base law | status |",
        "|---|---:|---|---|",
    ]
    for e in entries[:60]:
        lines.append(f"| {e['reference_name']} | {e['occurrences']} | "
                     f"`{e['base_law_id']}` | {e['status']} |")
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"historical revision ledger: {len(entries)} obligations, "
          f"{payload['revision_lists_pinned']} revision lists pinned, "
          f"{payload['historical_candidates_total']} candidates "
          f"(NO law-data snapshot acquired)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
