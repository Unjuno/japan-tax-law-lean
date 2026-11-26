"""Tests for the guarded exception-gate class."""
from __future__ import annotations

import unittest

from scripts.ci.batch_exception_pipeline import select


class TestExceptionSelection(unittest.TestCase):
    def test_simple_exception_accepted(self):
        self.assertTrue(select("前項の規定は、次の各号のいずれかに該当する場合には、適用しない。"))

    def test_proviso_form_accepted(self):
        self.assertTrue(select("ただし、やむを得ない理由がある場合には、この限りでない。"))

    def test_numeric_norm_rejected(self):
        self.assertFalse(select("前項の規定は、五十万円を超える場合には、適用しない。"))

    def test_unrelated_norm_rejected(self):
        self.assertFalse(select("前項の規定を適用する。"))


if __name__ == "__main__":
    unittest.main()
