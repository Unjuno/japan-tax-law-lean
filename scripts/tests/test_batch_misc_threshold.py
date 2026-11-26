"""Tests for the two miscellaneous threshold wordings."""
from __future__ import annotations

import unittest

from scripts.ci.batch_misc_threshold_pipeline import parse


class TestMiscThresholdSelection(unittest.TestCase):
    def test_exceed_not_is_inclusive(self):
        self.assertEqual(parse("年間の合計額が、千二百万円を超えないこと。"), (12000000, "le"))

    def test_mitanai_is_strict(self):
        self.assertEqual(parse("予定価格が五十万円に満たない場合。"), (500000, "lt"))

    def test_other_numerals_rejected(self):
        self.assertIsNone(parse("第一条の規定により五十万円に満たない場合。"))
        self.assertIsNone(parse("五十万円を超え、百万円に満たない場合。"))


if __name__ == "__main__":
    unittest.main()
