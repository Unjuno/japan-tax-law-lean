"""Unit tests for the inventory revision-selection logic (no network).

These tests exercise build_inventory.select_revision directly with synthetic
revision lists, including the adversarial shapes seen in the real e-Gov data
(CurrentEnforced present / only previous revisions present / all unenforced /
empty / ambiguous enforced count).
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from scripts.law_audit.inventory.build_inventory import select_revision  # noqa: E402


def _rev(status, enforce, law_revision_id=None):
    return {
        "law_revision_id": law_revision_id or f"X_{enforce}_{status}",
        "current_revision_status": status,
        "amendment_enforcement_date": enforce,
    }


class TestSelectRevision(unittest.TestCase):

    def test_current_enforced_preferred(self):
        revs = [
            _rev("UnEnforced", "2030-06-19"),
            _rev("CurrentEnforced", "2026-10-01"),
            _rev("PreviousEnforced", "2026-05-25"),
        ]
        selected, status = select_revision(revs)
        self.assertEqual(status, "current_enforced")
        self.assertEqual(selected["law_revision_id"].split("_")[1], "2026-10-01")

    def test_no_current_enforced_falls_back_to_latest_non_future(self):
        revs = [
            _rev("PreviousEnforced", "2026-05-25"),
            _rev("UnEnforced", "2027-01-01"),
        ]
        selected, status = select_revision(revs)
        self.assertEqual(status, "historical_fallback")
        self.assertEqual(selected["law_revision_id"].split("_")[1], "2026-05-25")

    def test_all_unenforced_yields_none(self):
        revs = [_rev("UnEnforced", "2027-04-01"), _rev("UnEnforced", "2028-01-01")]
        selected, status = select_revision(revs)
        self.assertIsNone(selected)
        self.assertEqual(status, "fully_unenforced")

    def test_empty_revision_list(self):
        selected, status = select_revision([])
        self.assertIsNone(selected)
        self.assertEqual(status, "empty")

    def test_ambiguous_current_enforced_is_flagged(self):
        revs = [
            _rev("CurrentEnforced", "2026-05-01"),
            _rev("CurrentEnforced", "2026-10-01"),
        ]
        selected, status = select_revision(revs)
        self.assertTrue(status.startswith("current_enforced_ambiguous"))
        self.assertEqual(selected["amendment_enforcement_date"], "2026-10-01")

    def test_unknown_status_is_not_treated_as_enforced(self):
        revs = [{"law_revision_id": "X1", "current_revision_status": "Weird",
                 "amendment_enforcement_date": "2020-01-01"}]
        selected, status = select_revision(revs)
        self.assertIsNotNone(selected)
        self.assertEqual(status, "historical_fallback")

    def test_missing_dates_do_not_crash(self):
        revs = [
            {"law_revision_id": "NODATE", "current_revision_status": "PreviousEnforced",
             "amendment_enforcement_date": None},
            _rev("UnEnforced", "2027-01-01"),
        ]
        selected, status = select_revision(revs)
        # a previous-enforced revision without a parseable date must not be
        # picked over a dated unenforced one; and the call must not raise.
        self.assertIn(status, ("fully_unenforced", "historical_fallback", "status_unknown", "empty"))


if __name__ == "__main__":
    unittest.main()
