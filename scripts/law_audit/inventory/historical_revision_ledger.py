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
OUT_JSON = REPO / "build" / "historical_revisions.json"
OUT_MD = REPO / "docs" / "HISTORICAL_REVISIONS.md"
STATUS = "PIN_REQUIRED_NOT_DONE"


def main() -> int:
    d = json.loads(DISCOVERED.read_text(encoding="utf-8")) if DISCOVERED.exists() else {}
    hist = [e for e in d.get("entries", [])
            if e.get("resolution") == "HISTORICAL_VERSION"]
    entries = []
    for e in sorted(hist, key=lambda x: (-x["occurrences"], x["name"])):
        entries.append({
            "reference_name": e["name"],
            "occurrences": e["occurrences"],
            "base_law_id": e.get("law_id", ""),
            "layer": "HISTORICAL_REVISION",
            "status": STATUS,
            "pinned_revision_id": "",
            "raw_snapshot": "",
            "sha256": "",
            "note": "new/旧 prefix in 附則; exact target revision requires e-Gov pin + 附則 context",
        })
    payload = {
        "tool": "scripts/law_audit/inventory/historical_revision_ledger.py",
        "snapshot_date": d.get("inventory_snapshot_date", ""),
        "historical_references": len(entries),
        "distinct_base_laws": len({e["base_law_id"] for e in entries if e["base_law_id"]}),
        "pinned": sum(1 for e in entries if e["pinned_revision_id"]),
        "not_pinned": sum(1 for e in entries if not e["pinned_revision_id"]),
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
        "to be distinguished from unenforced and unobtained sources. Each entry "
        "below is an explicit PIN obligation. NONE is pinned: no historical "
        "snapshot, revision id or SHA-256 is claimed.",
        "",
        f"- snapshot: {payload['snapshot_date']}",
        f"- historical references: {payload['historical_references']}",
        f"- distinct base laws: {payload['distinct_base_laws']}",
        f"- pinned: {payload['pinned']}",
        f"- not pinned: {payload['not_pinned']}",
        "",
        "| reference | occurrences | base law | status |",
        "|---|---:|---|---|",
    ]
    for e in entries[:60]:
        lines.append(f"| {e['reference_name']} | {e['occurrences']} | "
                     f"`{e['base_law_id']}` | {e['status']} |")
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"historical revision ledger: {len(entries)} obligations, 0 pinned")
    return 0


if __name__ == "__main__":
    sys.exit(main())
