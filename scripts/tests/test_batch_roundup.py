"""Tests for the guarded round-up (端数切り上げ) class."""
from __future__ import annotations

import unittest

from scripts.ci.batch_roundup_pipeline import unit_of


class TestRoundUpSelection(unittest.TestCase):
    def test_round_up_accepted(self):
        self.assertEqual(unit_of(
            "当該計算した金額に千円未満の端数があるとき、又はその全額が千円未満であるときは、"
            "その端数金額又はその全額を切り上げる。"), 1000)

    def test_competing_modes_rejected(self):
        self.assertIsNone(unit_of("百円未満の端数を切り捨てる。"))
        self.assertIsNone(unit_of("百円未満の端数を四捨五入する。"))

    def test_other_numeric_content_rejected(self):
        self.assertIsNone(unit_of("総額の三分の二に一円未満の端数を切り上げる。"))


if __name__ == "__main__":
    unittest.main()
