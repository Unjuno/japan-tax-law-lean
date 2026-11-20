#!/usr/bin/env python3
"""Tests for structural-spec source correspondence (no numeric literals)."""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"
spec = importlib.util.spec_from_file_location("ve_struct", CI / "generate_verification_evidence.py")
ve = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ve)


class ClauseCorrespondenceTests(unittest.TestCase):
    def test_numeric_spec_uses_literals(self):
        text = "…に百分の九十・七の税率を乗じて計算した金額とする。"
        ok, basis = ve.clause_correspondence({907, 1000}, text, [])
        self.assertTrue(ok)
        self.assertIn("spec numerals", basis)

    def test_structural_spec_uses_pinned_needle_in_the_clause(self):
        needle = "基準事業税額から標準税率相当額を控除した額を当該基準事業税額で除して算定した率"
        clause = "毎年度、道府県知事が" + needle + "とする。"
        ok, basis = ve.clause_correspondence(set(), clause, [needle])
        self.assertTrue(ok)
        self.assertIn("pinned needle", basis)

    def test_wrong_clause_does_not_inherit_needle(self):
        needle = "特定的な原文"
        ok, basis = ve.clause_correspondence(set(), "全く別の条文の文言。", [needle])
        self.assertFalse(ok, "a needle in another clause must not qualify this clause")

    def test_rate_table_requires_two_independent_anchors(self):
        clause = "第一号 百分の十の税率を課する。"
        scoped = clause + "第二号 百分の二十の税率を課する。"
        ok, basis = ve.clause_correspondence({10, 100, 20}, clause, ["百分の十"], scoped)
        self.assertTrue(ok)
        self.assertIn("scoped article", basis)
        # needle in clause but a missing table literal must fail
        self.assertFalse(ve.clause_correspondence({10, 100, 30}, clause, ["百分の十"], scoped)[0])
        # all literals present but no needle in this clause must fail
        self.assertFalse(ve.clause_correspondence({10, 100, 20}, clause, ["別の条"], scoped)[0])

    def test_no_needle_and_no_literals_is_not_source_correspondence(self):
        ok, _ = ve.clause_correspondence(set(), "いずれの needle もない文言。", [])
        self.assertFalse(ok)

    def test_structural_spec_module_is_attested(self):
        """End-to-end: a structural spec with all other gates yields evidence."""
        payload = ve.build()
        units = payload["units"]
        bd = payload["module_detail"].get("BusinessOwnerDeduction", {})
        # Find any unit whose correspondence basis is a pinned needle
        needle_units = [v for v in units.values()
                        if "pinned needle" in str(v.get("source_correspondence_audit", ""))]
        self.assertTrue(needle_units, "at least one structural-spec unit should be attested")
        for v in needle_units:
            self.assertTrue(v["source_correspondence_audit"])
            self.assertTrue(v["kernel_proof"])


if __name__ == "__main__":
    unittest.main(verbosity=2)
