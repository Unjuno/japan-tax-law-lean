"""Tests for the bulk exclusion-gate selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_exception_bulk_pipeline import select, modules


class TestExceptionBulk(unittest.TestCase):
    def test_exclusion_accepted(self):
        self.assertTrue(select("ただし、特別の理由がある場合には、この限りでない。"))
        self.assertTrue(select("手数料（買付けを代理する者への支払を除く。）"))

    def test_heading_rejected(self):
        self.assertFalse(select("（免税又は戻し税等）"))

    def test_module_has_per_unit_namespace(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("def specOutcome", spec)
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", tests)


if __name__ == "__main__":
    unittest.main()
