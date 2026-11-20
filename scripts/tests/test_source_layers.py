#!/usr/bin/env python3
"""Regression tests for separate source-layer management (Objective §2)."""
from __future__ import annotations

import hashlib
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
        # a few official ordinance pages may be pinned, but this never equals the
        # full municipality count and is never merged into the statutory ledger.
        l2 = by["L2_ORDINANCE"]
        self.assertLess(l2["count_acquired"], l2["count"])
        self.assertEqual(l2["verification_status"], "OUT_OF_SCOPE")
        self.assertNotEqual(by["L0_STATUTE"]["count"], l2["count"])
        self.assertEqual(by["L6_HISTORICAL"]["scope_status"], "HISTORICAL_LAYER")
        self.assertGreater(by["L6_HISTORICAL"]["count"], 0)

    def test_statutory_layer_is_provisional_not_complete(self):
        l0 = self.reg["layers"][0]
        self.assertEqual(l0["layer_id"], "L0_STATUTE")
        self.assertEqual(l0["scope_status"], "PROVISIONAL_POPULATION")
        self.assertNotEqual(l0["verification_status"], "FULLY_VERIFIED")

    def test_auxiliary_index_is_pinned_but_not_content(self):
        ai = self.reg.get("auxiliary_index_acquisition")
        if ai is None:
            self.skipTest("no auxiliary index acquired in this checkout")
        self.assertEqual(ai["layer_id"], "L4_CIRCULAR")
        self.assertEqual(ai["content_acquired"], False)
        self.assertEqual(ai["error_page_rejected"], True)
        self.assertEqual(len(ai["raw_sha256"]), 64)
        self.assertGreater(ai["raw_bytes"], 5000)
        raw = sl.REPO / ai["raw_file"]
        self.assertTrue(raw.exists())

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


class HistoricalLayerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.reg = sl.build()

    def test_historical_snapshots_pinned_only_not_verified(self):
        by = {l["layer_id"]: l for l in self.reg["layers"]}
        l6 = by["L6_HISTORICAL"]
        self.assertEqual(l6["scope_status"], "HISTORICAL_LAYER")
        self.assertEqual(l6["verification_status"], "OUT_OF_SCOPE")
        self.assertIn(l6["acquisition_status"], ("NOT_PINNED", "ACQUIRED_PINNED_ONLY"))

    def test_historical_acquisition_is_honest(self):
        ha = self.reg.get("historical_acquisition")
        if ha is None:
            self.skipTest("no historical revision pinned in this checkout")
        self.assertEqual(ha["verification_status"], "OUT_OF_SCOPE")
        self.assertIn("pinned only", ha["claim"])
        acquired = [v for v in ha["revisions"].values()
                    if v.get("acquisition_status") == "ACQUIRED_PINNED"]
        self.assertEqual(ha["count_acquired"], len(acquired))
        for v in acquired:
            self.assertEqual(len(v["raw_sha256"]), 64)
            self.assertGreater(v["raw_bytes"], 1000)
            self.assertIn(v["revision_status"], ("PreviousEnforced", "UnEnforced"))
            raw = sl.REPO / v["raw_file"]
            self.assertTrue(raw.exists())
            self.assertEqual(hashlib.sha256(raw.read_bytes()).hexdigest(), v["raw_sha256"])
            payload = json.loads(raw.read_text(encoding="utf-8"))
            self.assertTrue(payload.get("law_full_text"))


class CaseLawLayerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.reg = sl.build()

    def test_caselaw_pinned_only_not_binding_or_verified(self):
        by = {l["layer_id"]: l for l in self.reg["layers"]}
        l5 = by["L5_CASELAW"]
        self.assertEqual(l5["scope_status"], "AUXILIARY_LAYER")
        self.assertEqual(l5["verification_status"], "OUT_OF_SCOPE")
        self.assertIn(l5["acquisition_status"], ("NOT_ACQUIRED", "ACQUIRED_PINNED_ONLY"))

    def test_caselaw_acquisition_is_honest_and_hash_verified(self):
        ca = self.reg.get("caselaw_acquisition")
        if ca is None:
            self.skipTest("no case-law page pinned in this checkout")
        self.assertEqual(ca["verification_status"], "OUT_OF_SCOPE")
        self.assertIn("not parsed", ca["claim"])
        rows = ([ca["index"]] if ca.get("index") else []) + list(ca.get("judgments") or [])
        acquired = [r for r in rows if r.get("acquisition_status") == "ACQUIRED_PINNED"]
        self.assertEqual(ca["count_acquired"], len(acquired))
        for r in acquired:
            self.assertEqual(len(r["raw_sha256"]), 64)
            self.assertGreater(r["raw_bytes"], 20000)
            raw = sl.REPO / r["raw_file"]
            self.assertTrue(raw.exists())
            self.assertEqual(hashlib.sha256(raw.read_bytes()).hexdigest(), r["raw_sha256"])
        for j in ca.get("judgments") or []:
            self.assertIn("裁判例結果詳細", (sl.REPO / j["raw_file"]).read_bytes().decode("utf-8", errors="replace"))


class OrdinanceLayerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.reg = sl.build()

    def test_ordinance_pins_not_full_coverage_not_verified(self):
        by = {l["layer_id"]: l for l in self.reg["layers"]}
        l2 = by["L2_ORDINANCE"]
        self.assertEqual(l2["scope_status"], "DECLARED_UNSUPPORTED")
        self.assertEqual(l2["verification_status"], "OUT_OF_SCOPE")
        self.assertLess(l2["count_acquired"], l2["count"])

    def test_ordinance_acquisition_is_honest_and_hash_verified(self):
        oa = self.reg.get("ordinance_acquisition")
        if oa is None:
            self.skipTest("no ordinance pinned in this checkout")
        self.assertEqual(oa["verification_status"], "OUT_OF_SCOPE")
        self.assertIn("third-party", oa["index_source"].lower())
        self.assertIn("NOT claimed", oa["claim"])
        acquired = [r for r in oa["ordinances"]
                    if r.get("acquisition_status") == "ACQUIRED_PINNED"]
        self.assertEqual(oa["count_acquired"], len(acquired))
        for r in acquired:
            self.assertEqual(len(r["raw_sha256"]), 64)
            self.assertGreater(r["raw_bytes"], 100000)
            self.assertEqual(r["source_type"], "official_municipal_site")
            raw = sl.REPO / r["raw_file"]
            self.assertTrue(raw.exists())
            self.assertEqual(hashlib.sha256(raw.read_bytes()).hexdigest(), r["raw_sha256"])
            self.assertIn("市税条例", raw.read_bytes().decode("utf-8", errors="replace"))


if __name__ == "__main__":
    unittest.main(verbosity=2)
