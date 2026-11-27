"""Tests for the long-form exclusion-dispatch selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_exception_long_bulk_pipeline import select, modules


class TestExceptionLongBulk(unittest.TestCase):
    def test_long_clause_accepted(self):
        text = "課税価格は、次項本文の規定の適用がある場合を除き、" + "入力価格に基づき算定する。" + "あ" * 120
        self.assertGreaterEqual(len(text), 121)
        self.assertTrue(select(text))

    def test_short_clause_rejected(self):
        self.assertFalse(select("ただし、この限りでない。"))
        self.assertFalse(select("（免税又は戻し税等）"))

    def test_no_keyword_rejected(self):
        self.assertFalse(select("課税標準及び税率は、別表に定めるところによる。" + "あ" * 120))

    def test_module_has_per_unit_namespace(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("def outcome", impl)
        self.assertIn("def specOutcome", spec)
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", tests)


if __name__ == "__main__":
    unittest.main()
