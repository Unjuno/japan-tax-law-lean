"""Regression tests for the source-layer ledger (Objective §2/§5)."""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "law_audit" / "inventory"))
import source_layers as sl  # noqa: E402


class SourceLayerTests(unittest.TestCase):
    def test_auxiliary_layers_are_separate_and_unverified(self):
        data = sl.build()
        by_id = {l["id"]: l for l in data["layers"]}
        for lid in ("TAX_TREATY", "ADMINISTRATIVE_CIRCULAR", "CASE_LAW", "LOCAL_TAX_ORDINANCE"):
            layer = by_id[lid]
            self.assertEqual(layer["enumeration_status"], sl.UNENUMERATED)
            self.assertFalse(layer["counted_in_verified"])
        self.assertFalse(data["all_complete_claimable"])

    def test_statutory_layer_is_provisional(self):
        data = sl.build()
        national = next(l for l in data["layers"] if l["id"] == "NATIONAL_TAX_STATUTE")
        self.assertTrue(national["counted_in_target"])
        self.assertFalse(national["counted_in_verified"])
        self.assertIn("暂定", national["note"])

    def test_finding_has_ht_dcu(self):
        data = sl.build()
        for key in ("H", "T", "D", "C", "U"):
            self.assertTrue(data["finding"][key])
        self.assertTrue(data["finding"]["D"].startswith("FAIL"))

    def test_render_reports_unknown_not_zero(self):
        data = sl.build()
        if data["historical_reference_occurrences"] is None:
            self.assertIn("unknown", sl.render(data))


if __name__ == "__main__":
    unittest.main()
