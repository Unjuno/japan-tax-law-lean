"""Regression guards for the integer-percentage rate pipeline.

Two source shapes must never be modelled as 百分のN / 100:
  - 百分の一・四 is 1.4%, not 1%;
  - 四百分の二百 is 200/400, not 200/100.
The first batch attempt produced a source-audit FAIL for the latter; the unit
was left NOT_STARTED, and these guards now reject both before modelling.
"""
from __future__ import annotations

import unittest

from scripts.ci.batch_rate_pipeline import DECIMAL_PCT_RE, NON_HUNDRED_DENOM_RE


class TestRateSelectionGuards(unittest.TestCase):
    def test_decimal_percentage_rejected(self):
        self.assertTrue(DECIMAL_PCT_RE.search("固定資産税の標準税率は、百分の一・四とする。"))
        self.assertTrue(DECIMAL_PCT_RE.search("都市計画税の税率は、百分の〇・三を超えることができない。"))
        self.assertFalse(DECIMAL_PCT_RE.search("法人税割の標準税率は、百分の一とする。"))

    def test_non_hundred_denominator_rejected(self):
        self.assertTrue(NON_HUNDRED_DENOM_RE.search(
            "合計した面積に四百分の二百を乗じて得た面積"))
        self.assertFalse(NON_HUNDRED_DENOM_RE.search(
            "課税標準法人税額に百分の十・三の税率を乗じて計算した金額"))
        self.assertFalse(NON_HUNDRED_DENOM_RE.search("標準税率は、百分の百十とする。"))


if __name__ == "__main__":
    unittest.main()
