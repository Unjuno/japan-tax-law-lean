"""Tests for the guarded deduction-amount parser."""
from __future__ import annotations

import unittest

from scripts.ci.batch_deduction_pipeline import deduction_of


class TestDeductionSelection(unittest.TestCase):
    def test_simple_deduction(self):
        self.assertEqual(deduction_of(
            "居住者が寡婦である場合には、その者のその年分の総所得金額から二十七万円を控除する。"), 270000)

    def test_fragment_rejected(self):
        self.assertIsNone(deduction_of("二千五百万円（既にこの条の規定の適用を受けて控除した金額がある場合には、その金額の合計額を控除した残額）"))

    def test_other_numerals_rejected(self):
        self.assertIsNone(deduction_of("第一条の規定により五十万円を控除する。"))


if __name__ == "__main__":
    unittest.main()
