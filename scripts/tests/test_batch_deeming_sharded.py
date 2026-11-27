"""Tests for the sharded long-form deeming guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_deeming_sharded_pipeline import select, modules


class TestDeemingSharded(unittest.TestCase):
    def test_long_deeming_accepted(self):
        text = "当該取引があつたものとみなして、" + "前項の規定を適用する。" + "あ" * 120
        self.assertGreaterEqual(len(text), 121)
        self.assertTrue(select(text))

    def test_short_and_parenthesized_rejected(self):
        self.assertFalse(select("これをみなす。"))
        self.assertFalse(select("（みなし規定" + "あ" * 120 + "）"))

    def test_no_deeming_keyword_rejected(self):
        self.assertFalse(select("課税標準は、別表に定める。" + "あ" * 140))

    def test_kernel_obligations_present(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("theorem trigger_required", impl)
        self.assertIn("theorem treatment_required", impl)
        self.assertIn("theorem trigger_alone_insufficient", impl)
        self.assertIn("def specDeemed", spec)
        self.assertIn("theorem agree", spec)


if __name__ == "__main__":
    unittest.main()
