"""Tests for the same-treatment extension selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_same_treatment_pipeline import select


class TestSameTreatmentSelection(unittest.TestCase):
    def test_same_treatment_accepted(self):
        self.assertTrue(select("当該延長された期間を延長する場合においても、同様とする。"))
        self.assertTrue(select("加算金の決定をすることができる期間についても、また同様とする。"))

    def test_numeric_norm_rejected(self):
        self.assertFalse(select("五十万円を超える場合には、同様とする。"))


if __name__ == "__main__":
    unittest.main()
