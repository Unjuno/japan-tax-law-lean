"""Tests for separate-layer related-law acquisition (Objective §2)."""
from __future__ import annotations

import importlib.util
import json
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MODULE = REPO / "scripts" / "law_audit" / "inventory" / "acquire_related_law.py"
spec = importlib.util.spec_from_file_location("acquire_related_law", MODULE)
ACQ = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ACQ)


class RevisionSelectionTests(unittest.TestCase):
    def test_current_enforced_preferred(self):
        revs = [
            {"law_revision_id": "old", "current_revision_status": "historical", "amendment_enforcement_date": "2020-01-01"},
            {"law_revision_id": "new", "current_revision_status": "CurrentEnforced", "amendment_enforcement_date": "2026-11-02"},
        ]
        got, status = ACQ.select_revision(revs)
        self.assertEqual(got["law_revision_id"], "new")
        self.assertEqual(status, "current_enforced")

    def test_future_revision_not_selected(self):
        revs = [
            {"law_revision_id": "future", "current_revision_status": "UnEnforced", "amendment_enforcement_date": "2027-04-01"},
            {"law_revision_id": "past", "current_revision_status": "historical", "amendment_enforcement_date": "2026-01-01"},
        ]
        got, status = ACQ.select_revision(revs)
        self.assertEqual(got["law_revision_id"], "past")
        self.assertEqual(status, "historical_fallback")

    def test_fully_unenforced_is_not_acquired(self):
        got, status = ACQ.select_revision([
            {"law_revision_id": "x", "current_revision_status": "UnEnforced", "amendment_enforcement_date": "2027-01-01"}
        ])
        self.assertIsNone(got)
        self.assertEqual(status, "fully_unenforced")


class LedgerTests(unittest.TestCase):
    def test_acquired_ledger_is_separate_from_inventory(self):
        ledger = json.loads((REPO / "data" / "RELATED_LAW_LEDGER.json").read_text(encoding="utf-8"))
        inv = json.loads((REPO / "data" / "INVENTORY.json").read_text(encoding="utf-8"))
        inv_ids = {str(l["law_id"]) for l in inv["laws"]}
        for lid, rec in ledger["laws"].items():
            self.assertNotIn(lid, inv_ids, "related law must not be added to INVENTORY")
            self.assertEqual(rec["acquisition_status"], "ACQUIRED")
            self.assertTrue(rec["raw_sha256"])
            self.assertIn("NOT_MODELLED", rec["verification_status"])
            raw = REPO / rec["raw_snapshot"]
            self.assertTrue(raw.exists())
            self.assertEqual(ACQ.sha(raw.read_bytes()), rec["raw_sha256"])


if __name__ == "__main__":
    unittest.main()
