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

    def test_candidate_key_still_stable(self):
        row = ["R", "candidate", "L", "T", "P", "7", "M", "E", "unreviewed", "", ""]
        key = L7.candidate_key(row)
        self.assertEqual(len(key), 20)
        self.assertEqual(key, L7.candidate_key(list(row) + ["H", "T", "D", "C", "U"]))


if __name__ == "__main__":
    unittest.main()
