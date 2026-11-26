"""Tests for the single-fraction scaling parser."""
from __future__ import annotations

import unittest

from scripts.ci.batch_fraction_scale_pipeline import components


class TestFractionScaleSelection(unittest.TestCase):
    def test_components_order(self):
        # 七十八分の二十二 = numerator 22, denominator 78.
        self.assertEqual(components("地方消費税の税率は、七十八分の二十二とする。"), (22, 78))
        self.assertEqual(components("価格の二分の一の額とする。"), (1, 2))

    def test_structural_refs_allowed(self):
        self.assertEqual(components("前条第一項に規定する税率の三分の二とする。"), (2, 3))

    def test_other_numerals_rejected(self):
        self.assertIsNone(components("五十万円の二分の一を乗じる。"))

    def test_multiple_fractions_rejected(self):
        self.assertIsNone(components("二分の一及び三分の二に相当する額。"))


if __name__ == "__main__":
    unittest.main()
