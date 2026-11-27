"""Tests for the sharded long-form legal-effect guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_effect_sharded_pipeline import select, modules


class TestEffectSharded(unittest.TestCase):
    def test_long_effect_accepted(self):
        text = "関税は、輸入貨物の価格を課税標準として課するものとし、" + "税率は別表による。" + "あ" * 120
        self.assertGreaterEqual(len(text), 121)
        self.assertTrue(select(text))

    def test_short_and_parenthesized_rejected(self):
        self.assertFalse(select("関税は、価格を課税標準として課する。"))
        self.assertFalse(select("（税率は別表による" + "あ" * 120 + "）"))

    def test_unrelated_long_text_rejected(self):
        self.assertFalse(select("本邦にある者から委託を受けた者が加工等をする。" + "あ" * 140))

    def test_kernel_obligations_present(self):
        impl, spec, tests = modules("BatchX", [("xabc", "uid")])
        self.assertIn("namespace JapanTaxLaw.BatchX.xabc", impl)
        self.assertIn("theorem requires_both", impl)
        self.assertIn("theorem base_required", impl)
        self.assertIn("def specEffect", spec)
        self.assertIn("theorem agree", spec)


if __name__ == "__main__":
    unittest.main()
