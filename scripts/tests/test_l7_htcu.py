"""Objective §5: every L7 detection candidate records H / T / D / C / U."""
from __future__ import annotations

import csv
import importlib.util
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MODULE = REPO / "scripts" / "ci" / "l7_candidates.py"
spec = importlib.util.spec_from_file_location("l7_candidates", MODULE)
L7 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(L7)

CSV = REPO / "docs" / "L7_CANDIDATES_UNREVIEWED.csv"
AXES = ("hypothesis", "reproduction_test", "decision", "competing_interpretation", "uncertainty")


class HtcuTests(unittest.TestCase):
    def test_header_has_five_axes(self):
        with CSV.open(encoding="utf-8", newline="") as f:
            header = next(csv.reader(f))
        for a in AXES:
            self.assertIn(a, header)

    def test_every_candidate_has_all_axes(self):
        with CSV.open(encoding="utf-8", newline="") as f:
            rows = list(csv.DictReader(f))
        self.assertGreater(len(rows), 3000)
        for row in rows:
            for a in AXES:
                self.assertTrue(row[a].strip(), f"missing {a} in {row['rule_id']}")
            self.assertTrue(row["hypothesis"].startswith("H:"))
            self.assertTrue(row["reproduction_test"].startswith("T:"))
            self.assertTrue(row["decision"].startswith("D:"))
            self.assertTrue(row["competing_interpretation"].startswith("C:"))
            self.assertTrue(row["uncertainty"].startswith("U:"))
            self.assertIn("unreviewed", row["decision"])
            self.assertIn(row["law_id"], row["uncertainty"])
            self.assertIn(row["line"], row["uncertainty"])

    def test_review_overlay_is_reflected_in_d_and_u(self):
        rec = {"rule_id": "R", "law_id": "L", "location": "P", "line": "7"}
        plain = L7.htcu(rec)
        self.assertIn("unreviewed", plain[2])
        self.assertIn("not recorded", plain[4])
        reviewed = L7.htcu(rec, {
            "review_status": "confirmed-anomaly", "reviewer": "Dr X",
            "review_date": "2026-11-20", "source_citation": "e-Gov p.3",
        })
        self.assertNotIn("unreviewed", reviewed[2])
        self.assertIn("confirmed-anomaly", reviewed[2])
        self.assertIn("Dr X", reviewed[2])
        self.assertIn("2026-11-20", reviewed[4])
        self.assertIn("e-Gov p.3", reviewed[4])

    def test_reproduction_uses_full_inventory_sweep(self):
        with CSV.open(encoding="utf-8", newline="") as f:
            row = next(csv.DictReader(f))
        self.assertIn("l7_candidates.py", row["reproduction_test"])
        self.assertNotIn("scripts.law_audit.audit", row["reproduction_test"])

    def test_candidate_key_still_stable(self):
        row = ["R", "candidate", "L", "T", "P", "7", "M", "E", "unreviewed", "", ""]
        key = L7.candidate_key(row)
        self.assertEqual(len(key), 20)
        self.assertEqual(key, L7.candidate_key(list(row) + ["H", "T", "D", "C", "U"]))


if __name__ == "__main__":
    unittest.main()
