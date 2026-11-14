"""Phase A: collect reference-relationship statistics for pinned raw laws.

For every law in INVENTORY.json with an on-disk, hash-verified raw snapshot,
run the existing e-Gov-JSON parser and measure how many legal references it
can see and classify (internal vs another enumerated law vs external).

It does NOT decide any finding is a legal defect: findings are discarded;
only AuditStats counts are reported.  Cross-law resolution uses the full
enumerated population's law_ids seen in lawlist (so references to any
legislated tax law that is in the registry classify as 'enumerated', not as
'unknown'); the target text itself stays authoritative.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from scripts.law_audit.model import load_law  # noqa: E402
from scripts.law_audit.rules import all_findings  # noqa: E402

INVENTORY = REPO_ROOT / "data" / "INVENTORY.json"
OUT = REPO_ROOT / "build" / "reference_stats.json"


def main() -> int:
    sys.stdout.reconfigure(encoding="utf-8")
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    docs = {}
    for rec in inv["laws"]:
        snap = rec.get("raw_snapshot")
        if not snap:
            continue
        path = REPO_ROOT / snap["source_file"]
        try:
            docs[rec["law_id"]] = load_law(path)
        except Exception as exc:  # noqa: BLE001 - report, do not silently succeed
            print(f"PARSE-FAIL {rec['law_id']}: {exc}")

    print(f"parsed {len(docs)} raw snapshots")
    stats_out = {}
    total_refs = total_internal = total_external = total_unsupported = 0
    for lid, doc in docs.items():
        others = {k: v for k, v in docs.items() if k != lid}
        _, stats = all_findings(doc, others)
        stats_out[lid] = {
            "law_title": doc.law_title,
            "law_revision_id": doc.revision_info.get("law_revision_id"),
            "articles_checked": stats.articles_checked,
            "paragraphs_checked": stats.paragraphs_checked,
            "items_checked": stats.items_checked,
            "references_extracted": stats.references_extracted,
            "references_internal_checked": stats.references_internal_checked,
            "references_external_unverified": stats.references_external_unverified,
            "references_unsupported": stats.references_unsupported,
        }
        total_refs += stats.references_extracted
        total_internal += stats.references_internal_checked
        total_external += stats.references_external_unverified
        total_unsupported += stats.references_unsupported

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(
        json.dumps(
            {
                "snapshot_date": inv.get("snapshot_date"),
                "raw_snapshots": len(docs),
                "totals": {
                    "references_extracted": total_refs,
                    "references_internal_checked": total_internal,
                    "references_external_unverified": total_external,
                    "references_unsupported": total_unsupported,
                },
                "laws": stats_out,
                "notes": [
                    "Counts are extraction/classification statistics, NOT defect counts.",
                    "external_unverified = references to laws whose identity/revision the extractor could not bind to an law registered in this ledger; they are explicitly UNVERIFIED, not errors.",
                    "internal = references resolved within the same law (or its enumerated shared population).",
                    "Only the 29 pinned core laws are covered by this run; the full population is registered in INVENTORY.json.",
                ],
            },
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )
    print(f"references extracted={total_refs} internal={total_internal} external_unverified={total_external} unsupported={total_unsupported}")
    print(f"wrote {OUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
