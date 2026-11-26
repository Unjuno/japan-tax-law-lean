"""Tests for the guarded truncation (端数切り捨て) class."""
from __future__ import annotations

import unittest

from scripts.ci.batch_rounding_pipeline import unit_of


class TestRoundingSelection(unittest.TestCase):
    def test_single_unit_accepted(self):
        self.assertEqual(unit_of(
            "地方税の課税標準額を計算する場合において、その額に千円未満の端数があるとき、"
            "又はその全額が千円未満であるときは、その端数金額又はその全額を切り捨てる。"), 1000)
        self.assertEqual(unit_of(
            "還付金等の額に一円未満の端数があるときは、その端数金額を切り捨てる。"), 1)

    def test_competing_rounding_modes_rejected(self):
        self.assertIsNone(unit_of("百円未満の端数を切り上げる。"))
        self.assertIsNone(unit_of("百円未満の端数を四捨五入する。"))

    def test_other_numeric_content_rejected(self):
        # A unit carrying a percentage requires an additional rate model.
        self.assertIsNone(unit_of(
            "その金額の百分の二十五に相当する金額（当該金額に百円未満の端数があるときは、"
            "これを切り捨てる。）を限度とする。"))
        self.assertIsNone(unit_of("千円未満の端数を切り捨て、二分の一を乗じる。"))


if __name__ == "__main__":
    unittest.main()
