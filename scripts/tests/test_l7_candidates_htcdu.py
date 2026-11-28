"""H/T/D/C/U coverage of every L7 candidate, and review-key stability."""
from __future__ import annotations

import csv
import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"
CSV_PATH = Path(__file__).resolve().parents[2] / "docs" / "L7_CANDIDATES_UNREVIEWED.csv"

spec = importlib.util.spec_from_file_location("l7c", CI / "l7_candidates.py")
l7c = importlib.util.module_from_spec(spec)
spec.loader.exec_module(l7c)


class TestCandidateHtcdu(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        with CSV_PATH.open(encoding="utf-8", newline="") as f:
            cls.rows = list(csv.DictReader(f))

    def test_header_has_htcdu(self):
        self.assertEqual(list(self.rows[0].keys())[-5:], ["H", "T", "D", "C", "U"])

    def test_every_candidate_has_all_five_fields(self):
        for axis in ("H", "T", "D", "C", "U"):
            empty = [r for r in self.rows if not r[axis].strip()]
            self.assertEqual(empty, [], f"empty {axis}")

    def test_decision_is_mechanical_reproduction(self):
        for r in self.rows:
            self.assertIn(r["D"], ("REPRODUCED", "NOT_REPRODUCED"))
            self.assertIn("re-run rules.all_findings", r["T"])

    def test_no_review_was_fabricated(self):
        for r in self.rows:
            self.assertEqual(r["review_status"], "unreviewed")
            self.assertEqual(r["reviewer"], "")
            self.assertEqual(r["review_date"], "")

    def test_all_rule_families_classified(self):
        unclassified = {r["rule_id"] for r in self.rows} - set(l7c.HT_HYPOTHESIS)
        self.assertEqual(unclassified, set())

    def test_review_key_stable_after_appending_htcdu(self):
        # Overlay keys are derived from the first 11 positional columns.
        # Appending H/T/D/C/U must not invalidate any sponsor review key.
        for r in self.rows:
            eleven = [r[k] for k in l7c.HEADER[:11]]
            full = [r[k] for k in l7c.HEADER]
            self.assertEqual(l7c.candidate_key(eleven), l7c.candidate_key(full))


if __name__ == "__main__":
    unittest.main()
