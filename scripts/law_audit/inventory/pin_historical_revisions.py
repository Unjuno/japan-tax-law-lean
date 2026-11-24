#!/usr/bin/env python3
"""Pin predecessor revisions for historical (旧法/新法) references.

For each base law named by a historical reference, this script fetches the
official revision list and pins the revision immediately preceding the one
enforced as of the 2026-11-15 snapshot. This is a CANDIDATE predecessor, not a
claim that it is the exact 旧法/新法 meant by the reference — that mapping
requires the amendment's chronology and is explicitly left unresolved.

Usage: python scripts/law_audit/inventory/pin_historical_revisions.py
"""
from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO / "scripts/law_audit/inventory"))
import build_inventory as bi  # noqa: E402

DISCOVERY = REPO / "data" / "RECURSIVE_DISCOVERY_RESOLVED.json"
OUT = REPO / "data" / "HISTORICAL_REVISION_PINS.json"
OUT_MD = REPO / "docs" / "HISTORICAL_REVISION_PINS.md"
SNAPSHOT = "2026-11-15"


def main() -> int:
    disc = json.loads(DISCOVERY.read_text(encoding="utf-8"))
    refs = disc.get("historical_version_references", [])
    pins: dict[str, dict] = {}
    for r in refs:
        lid = r.get("base_law_id", "")
        if not lid or lid in pins:
            continue
        rec = {
            "law_id": lid,
            "base_name": r.get("base_name", ""),
            "reference_names": [],
            "status": "UNRESOLVED",
            "note": "predecessor pin not established",
        }
        pins[lid] = rec
    for r in refs:
        rec = pins.get(r.get("base_law_id", ""))
        if rec and r.get("name") not in rec["reference_names"]:
            rec["reference_names"].append(r["name"])

    ok = 0
    for lid, rec in pins.items():
        try:
            payload = json.loads(bi.http_get_bytes(bi.REVISIONS_URL.format(law_id=lid)))
        except Exception as exc:  # noqa: BLE001
            rec["note"] = f"revision fetch failed: {str(exc)[:200]}"
            continue
        revs = payload.get("revisions") or []
        enforced = [x for x in revs
                    if (x.get("amendment_enforcement_date") or "") <= SNAPSHOT
                    and x.get("current_revision_status") != "UnEnforced"]
        if not enforced:
            rec["note"] = "no enforced revision as of snapshot"
            continue
        enforced.sort(key=lambda x: (x.get("amendment_enforcement_date") or "",
                                     x.get("law_revision_id") or ""))
        current = enforced[-1]
        earlier = [x for x in enforced
                   if (x.get("amendment_enforcement_date") or "") <
                   (current.get("amendment_enforcement_date") or "")]
        if not earlier:
            rec["note"] = "no strictly earlier enforced revision"
            continue
        earlier.sort(key=lambda x: (x.get("amendment_enforcement_date") or "",
                                    x.get("law_revision_id") or ""))
        pred = earlier[-1]
        rid = pred.get("law_revision_id")
        try:
            raw = bi.http_get_bytes(bi.LAW_DATA_URL.format(law_revision_id=rid))
        except Exception as exc:  # noqa: BLE001
            rec["note"] = f"predecessor snapshot fetch failed: {str(exc)[:200]}"
            continue
        dest = REPO / "data/raw" / f"{rid}.law.json"
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(raw)
        rec.update({
            "current_revision": current.get("law_revision_id"),
            "current_enforcement": current.get("amendment_enforcement_date"),
            "predecessor_revision": rid,
            "predecessor_enforcement": pred.get("amendment_enforcement_date"),
            "source_file": str(dest.relative_to(REPO)).replace("\\", "/"),
            "source_sha256": hashlib.sha256(raw).hexdigest().upper(),
            "status": "PINNED_PREDECESSOR_CANDIDATE",
            "note": ("latest enforced revision strictly before the current one; "
                     "exact mapping to the 新/旧 reference is NOT established"),
        })
        ok += 1

    payload = {
        "claim": ("candidate predecessor pins only; exact 旧法/新法 mapping unresolved; "
                  "no formalization or legal review claimed"),
        "snapshot_date": SNAPSHOT,
        "reference_count": len(refs),
        "base_laws": len(pins),
        "pinned_candidates": ok,
        "pins": pins,
    }
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    lines = [
        "# Historical revision pins (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/inventory/pin_historical_revisions.py`.",
        "",
        "Objective §2: historical (新法/旧法) references in 附則・経過措置 are a",
        "separate layer. Each pin here is the latest enforced revision strictly",
        "before the current one — a CANDIDATE predecessor, NOT a claim about the",
        "exact revision meant by a given reference. Mapping remains unresolved.",
        "",
        f"- snapshot: {SNAPSHOT}",
        f"- references: {len(refs)} across {len(pins)} base laws",
        f"- predecessor candidates pinned: {ok}",
        "",
        "| law_id | base name | current | predecessor candidate | status |",
        "|---|---|---|---|---|",
    ]
    for lid, r in sorted(pins.items()):
        lines.append(f"| `{lid}` | {r.get('base_name','')} | {r.get('current_revision','')} | "
                     f"{r.get('predecessor_revision','')} | {r.get('status','')} |")
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"pinned {ok}/{len(pins)} predecessor candidates from {len(refs)} references")
    return 0


if __name__ == "__main__":
    sys.exit(main())
