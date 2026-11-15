#!/usr/bin/env python3
"""PHASE F (seed) — amendment provenance & revision-integrity checker.

Offline, deterministic measurement of the amendment-impact *base layer*:
for every resolved law in ``data/INVENTORY.json`` it verifies that the pinned
current revision tuple is mechanically consistent, and it reports which
amendment laws are present in the tax-law ledger (i.e., are themselves
tax-scope current laws) and which are absent. This is a provenance-integrity
pass, NOT semantic amendment-impact analysis: it never upgrades anything to
"verified" beyond what the hashes already attest.

e-Gov pin format (observed in ``data/raw/*.revisions.json`` and
``data/INVENTORY.json.current_revision``):

    law_revision_id  =  "{law_id}_{yyyymmdd}_{amendment_law_id}"
    law_id           =  3 digits + 2 alphanumerics + 10 digits (15 total)
    amendment id     =  same shape; the sentinel ``000000000000000`` denotes
                        the *original enactment* (no amending law), in which
                        case ``amendment_law_id`` is null/empty in the ledger

Checks per resolved record (any failure -> exit 1):
  1. ``law_revision_id`` starts with ``{law_id}_``;
  2. ``law_revision_id`` matches the three-part shape; its embedded
     amendment id must equal the ledger's ``amendment_law_id`` (with the
     sentinel-``000000000000000`` <-> empty-aid correspondence);
  3. ``amendment_promulgate_date`` and ``amendment_enforcement_date`` are
     non-null, ISO ``YYYY-MM-DD`` strings;
  4. ``amendment_enforcement_date`` <= ``snapshot_date`` (a pinned revision
     selected as "in force" must not be future-dated);
  5. when ``amendment_law_id`` is non-empty, it matches the law-id shape;
  6. if the embedded amendment id is non-zero, ``amendment_law_id`` must be
     non-empty and must not equal the sentinel.

External-coverage (report-only, never a failure): for each distinct
``amendment_law_id`` referenced, report whether the amending law itself is
present in the tax-law ledger (``law_id`` match). Tax-amendment acts that are
not tax-keyword laws will not be present — that is recorded, not flagged, and
the exact count is emitted as ``amendment_laws_outside_ledger``.

Emits ``build/phase_f_revision_impact.json`` and exits 0 iff all checks pass.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from datetime import date
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
INVENTORY = REPO_ROOT / "data" / "INVENTORY.json"
OUT = REPO_ROOT / "build" / "phase_f_revision_impact.json"
LAW_ID_RE = re.compile(r"^\d{3}[0-9A-Za-z]{2}\d{10}$")
DATE_RE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
SENTINEL_AID = "000000000000000"
RID_RE = re.compile(r"^(?P<lid>\d{3}[0-9A-Za-z]{2}\d{10})_(?P<d>\d{8})_(?P<aid>[0-9A-Za-z]{1,15})$")


def _parse_date(s):
    if not s:
        return None
    if not DATE_RE.match(s):
        return None
    try:
        y, m, d = int(s[:4]), int(s[5:7]), int(s[8:10])
        return date(y, m, d)
    except ValueError:
        return None


def analyze(inv: dict) -> dict:
    snapshot = inv.get("snapshot_date") or ""
    snap_date = _parse_date(snapshot)

    by_id = {r["law_id"]: r for r in inv.get("laws", [])}
    per_record = []
    problems: list[str] = []
    all_aids: list[str] = []

    for r in inv.get("laws", []):
        lid = r["law_id"]
        rec = {"law_id": lid, "pinned": False, "ok": True, "problems": []}
        cr = r.get("current_revision")
        if not cr:
            per_record.append(rec)
            continue
        rec["pinned"] = True
        rid = cr.get("law_revision_id") or ""
        pro = cr.get("amendment_promulgate_date")
        enf = cr.get("amendment_enforcement_date")
        aid = cr.get("amendment_law_id") or ""  # e-Gov emits null for original enactments

        # Check 1: prefix
        if not rid.startswith(f"{lid}_"):
            rec["problems"].append(f"law_revision_id {rid!r} lacks law_id prefix {lid}_")

        # Check 2: shape + embedded-amendment consistency with the ledger
        m = RID_RE.match(rid)
        if m:
            if m.group("lid") != lid:
                rec["problems"].append(f"law_revision_id embeds different law_id {m.group('lid')} != {lid}")
            embedded = m.group("aid")
            if embedded == SENTINEL_AID:
                if aid:
                    rec["problems"].append(
                        f"rid {rid} embeds sentinel 000000000000000 but ledger amendment_law_id={aid!r}"
                    )
            elif embedded != aid:
                rec["problems"].append(f"rid embeds amendment id {embedded!r} != ledger {aid!r}")
            elif not LAW_ID_RE.match(embedded):
                rec["problems"].append(f"rid amendment id {embedded!r} is not a law id")
        else:
            rec["problems"].append(
                f"law_revision_id {rid!r} does not match {{law_id}}_{{yyyymmdd}}_{{amendment_law_id}}"
            )

        # Check 3: dates parse
        pro_d = _parse_date(pro)
        enf_d = _parse_date(enf)
        if not (pro and pro_d):
            rec["problems"].append(f"amendment_promulgate_date {pro!r} missing/unparseable")
        if not (enf and enf_d):
            rec["problems"].append(f"amendment_enforcement_date {enf!r} missing/unparseable")

        # Check 4: pinned in-force revision must not be future-dated
        if enf_d and snap_date and enf_d > snap_date:
            rec["problems"].append(f"amendment_enforcement_date {enf} is after snapshot_date {snapshot}")

        # Check 5: amendment law id format (only when non-empty; empty == original enactment)
        if aid and not LAW_ID_RE.match(aid):
            rec["problems"].append(f"amendment_law_id {aid!r} does not match ^\\d{{3}}[0-9A-Za-z]{{2}}\\d{{10}}$")
        if aid and aid == SENTINEL_AID:
            rec["problems"].append("ledger marks this revision as original enactment but carries a sentinel amendment_law_id")

        all_aids.append(aid)
        rec["amendment_law_id"] = aid or None
        rec["is_original_enactment"] = (not aid) or aid == SENTINEL_AID
        rec["ok"] = not rec["problems"]
        problems.extend(f"{lid}: {p}" for p in rec["problems"])
        per_record.append(rec)

    amendments = [a for a in all_aids if a]
    in_ledger = sum(1 for a in set(amendments) if a in by_id)
    not_in_ledger = sorted({a for a in amendments if a not in by_id})

    report = {
        "tool": "phase_f.revision_impact",
        "status": "fail" if problems else "pass",
        "snapshot_date": snapshot,
        "records_total": len(per_record),
        "records_resolved_checked": sum(1 for r in per_record if r["pinned"]),
        "original_enactments": sum(1 for r in per_record if r.get("is_original_enactment")),
        "problems": problems,
        "amendment_coverage": {
            "distinct_amendment_laws": len(set(amendments)),
            "amendment_laws_in_tax_ledger": in_ledger,
            "amendment_laws_outside_tax_ledger": len(not_in_ledger),
            "outside_examples": not_in_ledger[:10],
            "note": (
                "Amendment acts that amend tax laws but are not themselves tax-keyword "
                "laws will not appear in the 327-record ledger; absence here is recorded, "
                "not flagged as anomalous. No amendment act is claimed read or formally checked."
            ),
        },
        "per_record": per_record,
    }
    return report


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--inventory", type=Path, default=INVENTORY)
    ap.add_argument("--out", type=Path, default=OUT)
    args = ap.parse_args()

    if not args.inventory.is_file():
        print(f"revision_impact: inventory not found: {args.inventory}", file=sys.stderr)
        return 2

    inv = json.loads(args.inventory.read_text(encoding="utf-8"))
    report = analyze(inv)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

    print(
        f"revision_impact: {report['status'].upper()} - "
        f"{report['records_resolved_checked']} pinned revisions checked, "
        f"{len(report['problems'])} problem(s), "
        f"{report['original_enactments']} original enactments, "
        f"amendment laws: {report['amendment_coverage']['distinct_amendment_laws']} distinct, "
        f"{report['amendment_coverage']['amendment_laws_outside_tax_ledger']} outside tax ledger (recorded, not judged)"
    )
    for p in report["problems"]:
        print(" -", p)
    return 0 if report["status"] == "pass" else 1


if __name__ == "__main__":
    raise SystemExit(main())
