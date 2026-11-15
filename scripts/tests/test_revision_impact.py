"""Unit tests for the PHASE F revision-integrity (provenance seed) checker.

Real repo must pass; synthetic failure trees cover each check and the
report-only amendment-coverage accounting (never a failure).
"""
from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from scripts.law_audit.phase_f import revision_impact  # noqa: E402


REAL_INVENTORY = REPO / "data" / "INVENTORY.json"


def _ledger(records):
    return {"snapshot_date": "2026-11-15", "summary": {"unresolved": []}, "laws": records}


def _rec(law_id, rid, pro, enf, aid, status="CurrentEnforced", audit_ready=True):
    return {
        "law_id": law_id,
        "law_num": "n",
        "official_title": "t",
        "promulgation_date": "19620402",
        "law_page": f"https://laws.e-gov.go.jp/law/{law_id}",
        "category": "tax_national",
        "phase": "A",
        "revisions_fetch": "ok",
        "current_revision": {
            "law_revision_id": rid,
            "current_revision_status": status,
            "amendment_promulgate_date": pro,
            "amendment_enforcement_date": enf,
            "amendment_law_id": aid,
        },
        "current_revision_status": status,
        "selection_status": "current_enforced",
        "raw_snapshot": (
            {"source_sha256": "A" * 64, "size_bytes": 1,
             "source_file": f"data/raw/{rid}.law.json"}
            if aid is not None else None
        ),
        "audit_ready": audit_ready,
    }


class TestRealRepo(unittest.TestCase):

    def test_real_repo_passes(self):
        inv = json.loads(REAL_INVENTORY.read_text(encoding="utf-8"))
        report = revision_impact.analyze(inv)
        self.assertEqual("pass", report["status"], report["problems"])
        self.assertEqual(0, len(report["problems"]))
        self.assertGreater(report["records_resolved_checked"], 0)
        self.assertEqual(48, report["original_enactments"])
        self.assertEqual(189, report["amendment_coverage"]["distinct_amendment_laws"])


class TestSynthetic(unittest.TestCase):

    def test_original_enactment_slot_passes(self):
        inv = _ledger([_rec("337AC0000000066",
                             "337AC0000000066_19620402_000000000000000",
                             "1962-04-02", "1962-04-02", None)])
        r = revision_impact.analyze(inv)
        self.assertEqual("pass", r["status"], r["problems"])
        self.assertEqual(1, r["original_enactments"])

    def test_future_enforcement_fails(self):
        inv = _ledger([_rec("337AC0000000066",
                             "337AC0000000066_20990101_507AC0000000013",
                             "2099-01-01", "2099-01-02", "507AC0000000013")])
        r = revision_impact.analyze(inv)
        self.assertEqual("fail", r["status"])

    def test_embedded_aid_mismatch_fails(self):
        inv = _ledger([_rec("337AC0000000066",
                             "337AC0000000066_20261101_507AC0000000099",
                             "2026-10-01", "2026-11-01", "507AC0000000013")])
        r = revision_impact.analyze(inv)
        self.assertEqual("fail", r["status"])
        self.assertTrue(any("embed" in p for p in r["problems"]))

    def test_original_enactment_flagging_sentinel_fails(self):
        inv = _ledger([_rec("337AC0000000066",
                             "337AC0000000066_20261101_000000000000000",
                             "2026-10-01", "2026-11-01", "000000000000000")])
        r = revision_impact.analyze(inv)
        self.assertEqual("fail", r["status"])

    def test_bad_date_fails(self):
        inv = _ledger([_rec("337AC0000000066",
                             "337AC0000000066_20261101_507AC0000000013",
                             "2026-13-99", "2026-11-01", "507AC0000000013")])
        r = revision_impact.analyze(inv)
        self.assertEqual("fail", r["status"])

    def test_unresolved_records_are_not_failures(self):
        rec = _rec("508CO0000000106", "", None, None, None,
                   status="fully_unenforced", audit_ready=False)
        rec["current_revision"] = None
        rec["current_revision_status"] = "fully_unenforced"
        inv = _ledger([rec])
        r = revision_impact.analyze(inv)
        self.assertEqual("pass", r["status"])
        self.assertEqual(0, r["records_resolved_checked"])

    def test_amendments_outside_ledger_reported_not_judged(self):
        inv = _ledger([_rec("337AC0000000066",
                             "337AC0000000066_20261101_507AC0000000013",
                             "2026-10-01", "2026-11-01", "507AC0000000013")])
        r = revision_impact.analyze(inv)
        self.assertEqual(1, r["amendment_coverage"]["amendment_laws_outside_tax_ledger"])


if __name__ == "__main__":
    unittest.main()
