"""Tests for the bulk reference-dispatch selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_reference_bulk_pipeline import select, modules


class TestReferenceBulk(unittest.TestCase):
    def test_reference_accepted(self):
        self.assertTrue(select("前項の規定による請求があつた場合には、調査する。"))
        self.assertFalse(select("（免税又は戻し税等）"))

    def test_numeric_rejected(self):
        self.assertFalse(select("五十万円を超える場合には、前項の規定を適用する。"))

    def test_module_has_per_unit_namespace(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("def specApplies", spec)
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", tests)


if __name__ == "__main__":
    unittest.main()
