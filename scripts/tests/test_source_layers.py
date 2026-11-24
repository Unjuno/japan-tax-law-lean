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

    def test_seven_distinct_layers(self):
        ids = [l["layer_id"] for l in self.reg["layers"]]
        self.assertEqual(len(ids), 7)
        self.assertEqual(len(set(ids)), 7)

    def test_auxiliary_layers_are_flagged_and_not_acquired(self):
        for l in self.reg["layers"]:
            if l["auxiliary"]:
                self.assertEqual(l["acquisition_status"], "NOT_ACQUIRED")
                self.assertEqual(l["verification_status"], "BACKLOG_NOT_ACQUIRED")
        aux = {l["layer_id"] for l in self.reg["layers"] if l["auxiliary"]}
        self.assertEqual(aux, {"L3_TREATY", "L4_CIRCULAR", "L5_CASELAW"})

    def test_ordinances_and_history_are_not_merged_into_statutes(self):
        by = {l["layer_id"]: l for l in self.reg["layers"]}
        self.assertEqual(by["L2_ORDINANCE"]["scope_status"], "IN_SCOPE_BACKLOG")
        self.assertGreater(by["L2_ORDINANCE"]["count"], 0)
        self.assertEqual(by["L2_ORDINANCE"]["count_acquired"], 0)
        self.assertEqual(by["L6_HISTORICAL"]["scope_status"], "HISTORICAL_LAYER")
        self.assertGreater(by["L6_HISTORICAL"]["count"], 0)

    def test_unacquired_layers_are_backlog_not_permanent_exclusions(self):
        """Directive §1/§5: UNSUPPORTED is a state, not a scope decision."""
        by = {l["layer_id"]: l for l in self.reg["layers"]}
        for lid in ("L2_ORDINANCE", "L3_TREATY", "L4_CIRCULAR",
                    "L5_CASELAW", "L6_HISTORICAL"):
            layer = by[lid]
            self.assertIn("backlog", layer)
            self.assertEqual(layer["backlog"]["layer_id"], lid)
            self.assertTrue(layer["backlog"]["next_action"])
            self.assertEqual(layer["backlog"]["legal_review"], "LEGAL_REVIEW_PENDING")
            self.assertEqual(layer["backlog"]["acquisition_evidence"], "")
        self.assertEqual(self.reg["backlog"]["task_count"], 5)
        self.assertNotIn("DECLARED_UNSUPPORTED",
                         [l["scope_status"] for l in self.reg["layers"]])
        self.assertNotIn("OUT_OF_SCOPE",
                         [l["verification_status"] for l in self.reg["layers"]])

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
        original = sl.QUEUE_DOC
        try:
            sl.QUEUE_DOC = sl.REPO / "docs" / "definitely_absent_queue.md"
            self.assertEqual(sl.queue_counts(), {})
            self.assertIsNone(sl.build()["verification_pipeline"]["fully_verified_units"])
        finally:
            sl.QUEUE_DOC = original


if __name__ == "__main__":
    unittest.main(verbosity=2)
