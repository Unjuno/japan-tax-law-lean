#!/usr/bin/env python3
"""Regression tests for separate source-layer management (Objective §2)."""
from __future__ import annotations

import importlib.util
import json
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"


def load():
    spec = importlib.util.spec_from_file_location("src_layers", CI / "source_layers.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


sl = load()


class LayerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.reg = sl.build()

    def test_eight_distinct_layers(self):
        ids = [l["layer_id"] for l in self.reg["layers"]]
        self.assertEqual(len(ids), 8)
        self.assertEqual(len(set(ids)), 8)

    def test_auxiliary_layers_are_flagged_and_not_verified(self):
        for l in self.reg["layers"]:
            if l["auxiliary"]:
                self.assertIn(l["acquisition_status"],
                              ("NOT_ACQUIRED", "ACQUIRED_PINNED_ONLY"))
                self.assertEqual(l["verification_status"], "OUT_OF_SCOPE")
        aux = {l["layer_id"] for l in self.reg["layers"] if l["auxiliary"]}
        self.assertEqual(aux, {"L3_TREATY", "L4_CIRCULAR", "L5_CASELAW",
                               "L7_DISCOVERED_SCOPE"})

    def test_discovered_scope_is_registered_but_not_merged(self):
        by = {l["layer_id"]: l for l in self.reg["layers"]}
        l7 = by["L7_DISCOVERED_SCOPE"]
        self.assertEqual(l7["scope_status"], "DISCOVERED_CANDIDATE_LAYER")
        self.assertGreater(l7["count"], 0)
        self.assertGreater(l7["count_acquired"], 0)
        self.assertEqual(l7["verification_status"], "OUT_OF_SCOPE")
        self.assertNotEqual(by["L0_STATUTE"]["count"], l7["count"])

    def test_ordinances_and_history_are_not_merged_into_statutes(self):
        by = {l["layer_id"]: l for l in self.reg["layers"]}
        self.assertEqual(by["L2_ORDINANCE"]["scope_status"], "DECLARED_UNSUPPORTED")
        self.assertGreater(by["L2_ORDINANCE"]["count"], 0)
        self.assertEqual(by["L2_ORDINANCE"]["count_acquired"], 0)
        self.assertEqual(by["L6_HISTORICAL"]["scope_status"], "HISTORICAL_LAYER")
        self.assertGreater(by["L6_HISTORICAL"]["count"], 0)

    def test_statutory_layer_is_provisional_not_complete(self):
        l0 = self.reg["layers"][0]
        self.assertEqual(l0["layer_id"], "L0_STATUTE")
        self.assertEqual(l0["scope_status"], "PROVISIONAL_POPULATION")
        self.assertNotEqual(l0["verification_status"], "FULLY_VERIFIED")

    def test_ledger_is_deterministic(self):
        committed = json.loads((sl.REPO / "data" / "SOURCE_LAYERS.json").read_text(encoding="utf-8"))
        self.assertEqual(committed, self.reg)

    def test_verification_pipeline_separate_denominators(self):
        p = self.reg["verification_pipeline"]
        for key in ("normative_units_total", "fully_verified_units", "proved_scope_units",
                    "not_started_units", "blocked_units", "human_legal_reviews"):
            self.assertIn(key, p)
            self.assertTrue(p[key] is None or isinstance(p[key], int))
        self.assertEqual(p["human_legal_reviews"], 0)

    def test_missing_queue_is_unknown_not_zero(self):
        original = sl.QUEUE
        try:
            sl.QUEUE = sl.REPO / "build" / "definitely_absent_queue.json"
            self.assertEqual(sl.queue_counts(), {})
            self.assertIsNone(sl.build()["verification_pipeline"]["fully_verified_units"])
        finally:
            sl.QUEUE = original


if __name__ == "__main__":
    unittest.main(verbosity=2)
