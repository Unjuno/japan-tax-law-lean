"""Tests for the decimal-percentage rate parser and its truncation guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_decimal_rate_pipeline import DEC, NUM, kanji_number


def numerator(verb: str) -> int | None:
    m = DEC.findall(verb)
    if len(m) != 1 or NUM.search(DEC.sub("", verb)):
        return None
    try:
        return 10 * kanji_number(m[0][0]) + kanji_number(m[0][1])
    except ValueError:
        return None


class TestDecimalRateParsing(unittest.TestCase):
    def test_one_point_four_percent_is_14_over_1000(self):
        self.assertEqual(numerator("固定資産税の標準税率は、百分の一・四とする。"), 14)

    def test_zero_point_three_percent_is_3_over_1000(self):
        self.assertEqual(numerator("都市計画税の税率は、百分の〇・三を超えることができない。"), 3)

    def test_ninety_seven_point_seven_percent(self):
        self.assertEqual(numerator("税率は、百分の九十・七とする。"), 907)

    def test_other_numerals_rejected(self):
        self.assertIsNone(numerator("一の納税義務者に係る百分の一・四の税率"))


if __name__ == "__main__":
    unittest.main()
