"""Guarded-class tests for multi-pair 読替え extraction."""
from __future__ import annotations

import unittest

from scripts.ci.batch_multi_reading_pipeline import pairs_of


class TestMultiReadingPairs(unittest.TestCase):
    def test_comma_and_no_comma_forms(self):
        self.assertEqual(pairs_of("この場合において、第一項中「甲」とあるのは「乙」と、「丙」とあるのは、「丁」と読み替えるものとする。"),
                         [("甲", "乙"), ("丙", "丁")])

    def test_repeated_source_phrase_kept_as_distinct_contexts(self):
        # The target provision selects which rewrite applies; that selection
        # is caller-established and is NOT resolved by the pipeline.
        text = "この場合において、第一項中「甲」とあるのは「乙」と、第二項中「甲」とあるのは「丙」と読み替えるものとする。"
        self.assertEqual(pairs_of(text), [("甲", "乙"), ("甲", "丙")])

    def test_read_as_tosuru_form(self):
        self.assertEqual(pairs_of("同項中「三月」とあるのは、「六月」とする。"),
                         [("三月", "六月")])
        self.assertEqual(pairs_of("同項中「甲」とあるのは「乙」と定める。"),
                         [("甲", "乙")])

    def test_identical_pair_rejected(self):
        self.assertEqual(pairs_of("「甲」とあるのは「甲」と読み替える。"), [])

    def test_missing_rewrite_verb_rejected(self):
        self.assertEqual(pairs_of("「甲」とあるのは「乙」と記憶する。"), [])

    def test_hostile_character_rejected(self):
        self.assertEqual(pairs_of('「甲"乙」とあるのは「丙」と読み替える。'), [])


if __name__ == "__main__":
    unittest.main()
