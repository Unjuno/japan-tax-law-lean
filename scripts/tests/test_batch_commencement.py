"""Tests for calculated-commencement selection and abstract period parsing."""
from __future__ import annotations

import unittest

from scripts.ci.batch_commencement_pipeline import parse


class TestCommencementSelection(unittest.TestCase):
    def test_bounded_delegation(self):
        self.assertEqual(parse(
            "この法律は、公布の日から起算して一年を超えない範囲内において政令で定める日から施行する。"), (1, "bounded"))
        self.assertEqual(parse(
            "この条例は、公布の日から起算して六月を超えない範囲内において政令で定める日（以下「施行日」という。）から施行する。"), (6, "bounded"))

    def test_fixed_delay(self):
        self.assertEqual(parse(
            "この法律は、公布の日から起算して三月を経過した日から施行する。"), (3, "fixed"))

    def test_non_exact_forms_rejected(self):
        self.assertIsNone(parse("この法律は、公布の日から施行する。"))
        self.assertIsNone(parse("公布の日から起算して六月を超えない範囲内において政令で定める日"))


if __name__ == "__main__":
    unittest.main()
