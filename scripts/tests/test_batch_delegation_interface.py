"""Tests for the delegation-interface selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_delegation_interface_pipeline import select, DELEG


class TestDelegationInterfaceSelection(unittest.TestCase):
    def test_delegation_phrases_accepted(self):
        self.assertTrue(select("前項の外国為替相場は、財務省令で定める。"))
        self.assertTrue(select("政令で定めるところにより、その関税を免除する。"))
        self.assertTrue(select("技術、設計その他政令で定めるもの"))

    def test_numeric_norm_rejected(self):
        self.assertFalse(select("五十万円を超える場合には政令で定める。"))

    def test_non_delegation_rejected(self):
        self.assertFalse(select("前項の規定を適用する。"))

    def test_deleg_pattern(self):
        self.assertTrue(DELEG.search("財務省令で定める"))
        self.assertTrue(DELEG.search("政令で定めるところにより"))
        self.assertFalse(DELEG.search("法律で定める"))


if __name__ == "__main__":
    unittest.main()
