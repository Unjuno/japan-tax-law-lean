"""Tests for the delegated-ceiling selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_delegated_limit_pipeline import select


class TestDelegatedLimitSelection(unittest.TestCase):
    def test_delegated_ceiling_accepted(self):
        self.assertTrue(select("金額が財務省令で定める額以下である場合は、この限りでない。"))
        self.assertTrue(select("政令で定める額を限度とする。"))

    def test_numeric_ceiling_rejected(self):
        self.assertFalse(select("金額が五十万円以下である場合は、この限りでない。"))


if __name__ == "__main__":
    unittest.main()
