"""Guarded-class tests for simple commencement norms."""
from __future__ import annotations

import unittest

from scripts.ci.batch_effective_promulgation_pipeline import offset_of


class TestCommencementOffsets(unittest.TestCase):
    def test_exact_forms(self):
        self.assertEqual(offset_of("この法律は、公布の日から施行する。"), 0)
        self.assertEqual(offset_of("この条例は、公布の日から施行する。"), 0)
        self.assertEqual(offset_of("この法律は、公布の日の翌日から施行する。"), 1)
        self.assertEqual(offset_of("この条例は、公布の日の翌日から施行する"), 1)

    def test_complex_commencement_rejected(self):
        # A norm that couples commencement to a separate applicability date
        # needs genuine modelling and must not enter this guarded class.
        self.assertIsNone(offset_of(
            "この法律は、公布の日から施行し、平成元年四月一日以後に国内において"
            "事業者が行う資産の譲渡等について適用する。"))
        self.assertIsNone(offset_of("この法律は、公布の日から起算して六月を経過した日から施行する。"))
        self.assertIsNone(offset_of("次の表のとおりとする。"))


if __name__ == "__main__":
    unittest.main()
