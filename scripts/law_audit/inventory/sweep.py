"""Phase B: run the structural audit engine over every pinned law.

For each law pinned in data/INVENTORY.json whose raw snapshot is present, parse
it, run `all_findings` with NO other-docs provided (honestly: cross-law
references cannot be verified here and are reported as external/unverified),
and record per-law counts.  A law that crashes the parser is recorded as
`parse_failure` — never silently skipped, never counted as verified.

Output: build/audit_sweep.json (machine) + printed summary.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from scripts.law_audit.model import load_law  # noqa: E402
from scripts.law_audit import rules  # noqa: E402

INVENTORY = REPO_ROOT / "data" / "INVENTORY.json"
OUT = REPO_ROOT / "build" / "audit_sweep.json"


def main() -> int:
    sys.stdout.reconfigure(encoding="utf-8")
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    records: dict[str, dict] = {}
    totals = {
        "laws_total": len(inv["laws"]),
        "parse_ok": 0,
        "parse_failure": 0,
        "audit_ok": 0,
        "audit_failure": 0,
        "articles_checked": 0,
        "paragraphs_checked": 0,
        "items_checked": 0,
        "references_extracted": 0,
        "references_internal_checked": 0,
        "references_external_unverified": 0,
        "references_unsupported": 0,
        "findings_verified_anomaly": 0,
        "findings_candidate": 0,
        "findings_other": 0,
    }
    failures = []
    for rec in inv["laws"]:
        lid = rec["law_id"]
        snap = rec.get("raw_snapshot")
        if not snap:
            records[lid] = {"status": "raw_not_pinned", "audit_ready_note": rec.get("current_revision_status")}
            continue
        path = REPO_ROOT / snap["source_file"]
        outcome: dict = {"law_id": lid, "official_title": rec.get("official_title")}
        try:
            doc = load_law(path)
        except Exception as exc:  # noqa: BLE001 - unparseable law is recorded, not fatal
            outcome["status"] = "parse_failure"
            outcome["error"] = f"{type(exc).__name__}: {exc}"
            records[lid] = outcome
            failures.append(outcome)
            totals["parse_failure"] += 1
            continue
        totals["parse_ok"] += 1
        try:
            findings, stats = rules.all_findings(doc, {})
        except Exception as exc:  # noqa: BLE001
            outcome["status"] = "audit_failure"
            outcome["error"] = f"{type(exc).__name__}: {exc}"
            records[lid] = outcome
            failures.append(outcome)
            totals["audit_failure"] += 1
            continue
        totals["audit_ok"] += 1
        outcome["status"] = "ok"
        outcome["articles_checked"] = stats.articles_checked
        outcome["paragraphs_checked"] = stats.paragraphs_checked
        outcome["items_checked"] = stats.items_checked
        outcome["references_extracted"] = stats.references_extracted
        outcome["references_internal_checked"] = stats.references_internal_checked
        outcome["references_external_unverified"] = stats.references_external_unverified
        outcome["references_unsupported"] = stats.references_unsupported
        by_rule: dict[str, int] = {}
        for f in findings:
            by_rule[f.rule_id] = by_rule.get(f.rule_id, 0) + 1
        outcome["by_rule"] = dict(sorted(by_rule.items()))
        outcome["findings_verified_anomaly"] = sum(1 for f in findings if f.severity == "verified-anomaly")
        outcome["findings_candidate"] = sum(1 for f in findings if f.severity == "candidate")
        outcome["findings_other"] = sum(1 for f in findings if f.severity not in ("verified-anomaly", "candidate"))
        records[lid] = outcome
        for k in (
            "articles_checked", "paragraphs_checked", "items_checked",
            "references_extracted", "references_internal_checked",
            "references_external_unverified", "references_unsupported",
            "findings_verified_anomaly", "findings_candidate", "findings_other",
        ):
            totals[k] += outcome[k]

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(
        json.dumps(
            {"snapshot_date": inv.get("snapshot_date"), "totals": totals,
             "failure_count": len(failures), "laws": records},
            ensure_ascii=False, indent=2,
        ),
        encoding="utf-8",
    )
    print(json.dumps(totals, ensure_ascii=False, indent=2))
    if failures:
        print("\nFAILURES (recorded as unsupported, not counted):")
        for f in failures:
            print(" -", f["law_id"], f["official_title"], "|", f.get("error"))
    print(f"\nwrote {OUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
