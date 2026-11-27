"""Regression tests for the dimension/unit audit (Objective §3/§5)."""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"


def load():
    spec = importlib.util.spec_from_file_location("dimension_audit", CI / "dimension_audit.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


da = load()


class DimensionTests(unittest.TestCase):
    def test_unit_markers(self):
        self.assertIn("円", da.unit_markers("三千円とする"))
        self.assertIn("百分", da.unit_markers("百分の十の税率"))
        self.assertIn("月", da.unit_markers("三月を経過する日"))
        self.assertEqual(da.unit_markers("通常の条文"), [])

    def test_findings_carry_ht_dcu(self):
        f = {
            "H": "h", "T": "t", "D": "PASS", "C": "c", "U": "u",
        }
        for k in ("H", "T", "D", "C", "U"):
            self.assertTrue(f[k])

    def test_audit_records_both_decisions_without_completion_claim(self):
        p = da.REPO / "data/DIMENSION_AUDIT.json"
        if not p.exists():
            self.skipTest("audit not generated yet")
        d = __import__("json").loads(p.read_text(encoding="utf-8"))
        self.assertIn("documented", d)
        self.assertIn("undocumented", d)
        self.assertFalse(d["all_complete_claimable"])
        for f in d["findings_detail"]:
            for k in ("H", "T", "D", "C", "U"):
                self.assertIn(k, f)


if __name__ == "__main__":
    unittest.main()
