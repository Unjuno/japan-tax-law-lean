"""Tests for the long-form conditional-dispatch selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_condition_long_bulk_pipeline import select, modules


class TestConditionLongBulk(unittest.TestCase):
    def test_long_clause_accepted(self):
        text = "前項の規定により課税価格を計算することができない場合において、" + "製造原価を確認することができるときは。" + "あ" * 80
        self.assertGreaterEqual(len(text), 121)
        self.assertTrue(select(text))

    def test_short_clause_rejected(self):
        self.assertFalse(select("前項の場合には、調査する。"))
        self.assertFalse(select("（免税又は戻し税等）"))

    def test_no_keyword_rejected(self):
        self.assertFalse(select("課税標準は、別表に定める。" + "あ" * 140))

    def test_kanji_numerals_allowed(self):
        text = "第五十条第一項の場合には、" + "あ" * 120
        self.assertTrue(select(text))

    def test_module_has_kernel_obligations(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("theorem requires_both", impl)
        self.assertIn("theorem false_antecedent_blocks", impl)
        self.assertIn("theorem agree", spec)
        self.assertIn("example : outcome true true = true", tests)


if __name__ == "__main__":
    unittest.main()
