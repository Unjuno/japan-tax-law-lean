"""Tests for list-wise reading substitution parsing."""
from __future__ import annotations

import unittest

from scripts.ci.batch_list_reading_pipeline import parse_pairs


class TestListReading(unittest.TestCase):
    def test_two_groups_zipped_positionally(self):
        s = ("この場合においては、「道府県」、「道府県税」とあるのは、それぞれ"
             "「都」、「都税」と、「市町村」とあるのは、それぞれ「特別区」と読み替えるものとする。")
        self.assertEqual(parse_pairs(s),
                         [("道府県", "都"), ("道府県税", "都税"), ("市町村", "特別区")])

    def test_mismatched_lengths_rejected(self):
        s = "「甲」、「乙」とあるのは、それぞれ「丙」と読み替える。"
        self.assertIsNone(parse_pairs(s))

    def test_simple_pair_rejected(self):
        # Single-pair forms belong to the multi-reading pipeline, not this one.
        self.assertIsNone(parse_pairs("「甲」とあるのは「乙」と読み替える。"))


if __name__ == "__main__":
    unittest.main()
