"""Tests for the mutatis-mutandis (準用) selection guard."""
from __future__ import annotations

import unittest

from scripts.ci.batch_mutatis_mutandis_pipeline import select


class TestMutatisSelection(unittest.TestCase):
    def test_reference_accepted(self):
        self.assertTrue(select("第六項及び第七項の規定は、第一項の場合について準用する。"))
        self.assertTrue(select("この場合においては、前条第五項の規定を準用する。"))

    def test_numeric_norm_rejected(self):
        self.assertFalse(select("五十万円を超える場合には、前項の規定を準用する。"))


if __name__ == "__main__":
    unittest.main()
