"""Regression: structural references are not statutory quantities."""
from __future__ import annotations

import unittest

from scripts.ci.batch_rate_pipeline import BARE_NUM_RE, PCT_RE


def has_bare_numeral(verb: str) -> bool:
    return bool(BARE_NUM_RE.search(PCT_RE.sub("", verb)))


class TestRateStructuralRefs(unittest.TestCase):
    def test_structural_refs_allowed(self):
        self.assertFalse(has_bare_numeral("第一条第二項の額に百分の十を乗じて得た額"))
        self.assertFalse(has_bare_numeral("次号に規定する金額の百分の五十を超える金額"))

    def test_statutory_quantities_rejected(self):
        self.assertTrue(has_bare_numeral("五十万円に百分の十を乗じて得た額"))
        self.assertTrue(has_bare_numeral("三年以内に百分の十を乗じて得た額"))
        self.assertTrue(has_bare_numeral("二以上の者に百分の十を乗じて得た額"))


if __name__ == "__main__":
    unittest.main()
