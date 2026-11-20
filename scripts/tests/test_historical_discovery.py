#!/usr/bin/env python3
"""Historical reference classification tests (Objective §2)."""
from __future__ import annotations

import importlib.util
import json
import unittest
from pathlib import Path

INV_DIR = Path(__file__).resolve().parents[1] / "law_audit" / "inventory"


def load():
    spec = importlib.util.spec_from_file_location("hist_disc", INV_DIR / "historical_discovery.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


hd = load()


class HistoricalTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data = hd.build()

    def test_no_historical_name_is_treated_as_acquired(self):
        self.assertTrue(self.data["names"])
        for r in self.data["names"]:
            self.assertFalse(r["snapshot_pinned"])
            self.assertEqual(r["acquisition_status"], "NOT_PINNED")
            self.assertEqual(r["verification_status"], "OUT_OF_SCOPE")

    def test_prefix_is_stripped_for_base_matching(self):
        self.assertEqual(hd.PREFIX_RE.match("旧法人税法").group(1), "法人税法")
        self.assertEqual(hd.PREFIX_RE.match("元年旧地方税法").group(1), "地方税法")
        self.assertEqual(hd.PREFIX_RE.match("新租税特別措置法").group(1), "租税特別措置法")

    def test_classification_matches_ledger_laws(self):
        classes = {r["class"] for r in self.data["names"]}
        self.assertTrue(classes)
        for r in self.data["names"]:
            self.assertIn(r["class"], {"HISTORICAL_OF_LEDGER_LAW",
                                       "UNENFORCED_LEDGER_LAW", "UNMATCHED_HISTORICAL_NAME"})
            if r["matched_law_id"]:
                self.assertIn("LEDGER_LAW", r["class"])

    def test_totals_are_consistent(self):
        t = self.data["totals"]
        self.assertEqual(sum(t["by_class"].values()), t["distinct_names"])
        self.assertEqual(sum(r["occurrences"] for r in self.data["names"]), t["occurrences"])

    def test_reported_total_is_not_mistaken_for_classified_subset(self):
        rep = self.data["reported_by_recursive_discovery"]
        self.assertIsNotNone(rep["names"])
        self.assertGreater(rep["names"], self.data["totals"]["distinct_names"])
        self.assertTrue(rep["note"])

    def test_committed_registry_is_deterministic(self):
        committed = json.loads((hd.REPO / "data" / "HISTORICAL_DISCOVERY.json").read_text(encoding="utf-8"))
        self.assertEqual(committed, self.data)


if __name__ == "__main__":
    unittest.main(verbosity=2)
