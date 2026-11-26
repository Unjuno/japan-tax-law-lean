"""Tests for the bulk structural-label batch encoder."""
from __future__ import annotations

import unittest

from scripts.ci.batch_structural_label_bulk import label_code, batch_modules_prefixed


class TestBulkStructuralLabel(unittest.TestCase):
    def test_label_codes(self):
        self.assertEqual(label_code("一"), (1, 0))
        self.assertEqual(label_code("六の二"), (6, 2))

    def test_module_has_per_unit_namespace(self):
        impl, spec, tests = batch_modules_prefixed("BatchX", [("xabc", (3, 0))])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("def labelCode : Nat × Nat := (3, 0)", impl)
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", spec)
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", tests)


if __name__ == "__main__":
    unittest.main()
