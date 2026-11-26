"""Tests for the presumption selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_presumption_pipeline import select


class TestPresumptionSelection(unittest.TestCase):
    def test_presumption_accepted(self):
        self.assertTrue(select("当該書類の提示がないときは、要件に該当しないものと推定する。"))
        self.assertTrue(select("社員が得た利益の額は、税理士法人に生じた損害の額と推定する。"))

    def test_numeric_norm_rejected(self):
        self.assertFalse(select("五十万円を超えるときは、利益と推定する。"))

    def test_non_presumption_rejected(self):
        self.assertFalse(select("当該書類を提示する。"))


if __name__ == "__main__":
    unittest.main()
