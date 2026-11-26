"""Tests for deeming-on-inaction selection and period parsing."""
from __future__ import annotations

import unittest

from scripts.ci.batch_deeming_pipeline import select


class TestDeemingSelection(unittest.TestCase):
    def test_period_literal(self):
        self.assertEqual(select(
            "譲渡があつた日から一年を経過する日において、対価が充てられていない場合には、"
            "譲渡をされたものとみなす。"), 1)
        self.assertEqual(select(
            "貸付期限から二月を経過する日までに供していない場合には、設定があつたものとみなす。"), 2)

    def test_referenced_period(self):
        self.assertEqual(select(
            "第二項に規定する期間内に税務署長が許可をしない場合には、許可があつたものとみなす。"), 0)

    def test_unrelated_norm_rejected(self):
        self.assertIsNone(select("第二項に規定する期間内に税務署長が許可をする。"))
        self.assertIsNone(select("当該金額をみなす。"))


if __name__ == "__main__":
    unittest.main()
