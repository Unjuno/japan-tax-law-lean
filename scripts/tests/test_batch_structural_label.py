"""Tests for structural item-label parsing and selection."""
from __future__ import annotations

import unittest

from scripts.ci.batch_structural_label_pipeline import label_code


class TestStructuralLabel(unittest.TestCase):
    def test_simple_labels(self):
        self.assertEqual(label_code("一"), (1, 0))
        self.assertEqual(label_code("十"), (10, 0))
        self.assertEqual(label_code("二十三"), (23, 0))

    def test_branch_labels(self):
        self.assertEqual(label_code("六の二"), (6, 2))
        self.assertEqual(label_code("十一の三"), (11, 3))

    def test_invalid_labels_rejected(self):
        self.assertIsNone(label_code("第一条"))
        self.assertIsNone(label_code("甲"))
        self.assertIsNone(label_code("の二"))


if __name__ == "__main__":
    unittest.main()
