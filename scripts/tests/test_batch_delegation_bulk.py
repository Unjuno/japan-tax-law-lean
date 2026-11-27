"""Tests for the bulk delegation-interface selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_delegation_bulk_pipeline import select, modules


class TestDelegationBulk(unittest.TestCase):
    def test_delegation_accepted(self):
        self.assertTrue(select("前項の外国為替相場は、財務省令で定める。"))
        self.assertTrue(select("政令で定めるところにより、その関税を免除する。"))

    def test_heading_rejected(self):
        self.assertFalse(select("（政令で定める範囲）"))

    def test_module_has_per_unit_namespace(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("def specActive", spec)
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", tests)


if __name__ == "__main__":
    unittest.main()
