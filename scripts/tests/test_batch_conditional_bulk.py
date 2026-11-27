"""Tests for the bulk conditional-dispatch selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_conditional_bulk_pipeline import select, modules


class TestConditionalBulk(unittest.TestCase):
    def test_conditional_accepted(self):
        self.assertTrue(select("税関長は、必要があると認められるときは、担保を提供させることができる。"))

    def test_heading_rejected(self):
        self.assertFalse(select("（変質、損傷等の場合の減税又は戻し税等）"))

    def test_numeric_rejected(self):
        self.assertFalse(select("五十万円を超える場合には、担保を提供させる。"))

    def test_module_has_per_unit_namespace(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("def specOutcome", spec)
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", tests)


if __name__ == "__main__":
    unittest.main()
