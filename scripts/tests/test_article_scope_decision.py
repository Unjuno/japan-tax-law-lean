"""Regression tests for article-scope D/C decisions (Objective §5).

The legacy diagnostic compared kanji ArticleTitle pins (第二十一条の五) with
e-Gov structural paths (Article/21_5) and reported D=FAIL for every check.
These tests lock the corrected, independently testable decision function.
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "law_audit" / "phase_e"))
import article_scope as scope  # noqa: E402


class ScopeDecisionTests(unittest.TestCase):
    NUM_MAP = {"第二十一条の五": "21_5", "第六十六条": "66"}

    def test_kanji_title_resolves_to_egov_num(self):
        hits = [{"unit": "MainProvision/Article/21_5"}]
        stated, competing = scope.scope_decision("第二十一条の五", self.NUM_MAP, hits)
        self.assertTrue(stated)
        self.assertEqual(competing, [])

    def test_cross_article_reuse_is_recorded_as_competing(self):
        hits = [
            {"unit": "MainProvision/Article/21_5"},
            {"unit": "MainProvision/Article/21_11_2"},
        ]
        stated, competing = scope.scope_decision("第二十一条の五", self.NUM_MAP, hits)
        self.assertTrue(stated)
        self.assertEqual(competing, ["MainProvision/Article/21_11_2"])

    def test_wrong_article_is_fail(self):
        hits = [{"unit": "MainProvision/Article/21_6"}]
        stated, _ = scope.scope_decision("第二十一条の五", self.NUM_MAP, hits)
        self.assertFalse(stated)

    def test_file_level_pin_with_main_article_hit_passes(self):
        hits = [{"unit": "MainProvision/Article/19_3"}]
        stated, competing = scope.scope_decision(None, self.NUM_MAP, hits)
        self.assertTrue(stated)
        self.assertEqual(competing, [])

    def test_no_hits_is_fail(self):
        stated, _ = scope.scope_decision("第六十六条", self.NUM_MAP, [])
        self.assertFalse(stated)


class ArticleTitleMapTests(unittest.TestCase):
    def test_title_to_num(self):
        doc = {"law_full_text": {"tag": "Law", "children": [
            {"tag": "MainProvision", "children": [
                {"tag": "Article", "attr": {"Num": "21_5"}, "children": [
                    {"tag": "ArticleTitle", "children": ["第二十一条の五"]}]}]}]}}
        self.assertEqual(scope.article_title_to_num(doc), {"第二十一条の五": "21_5"})


if __name__ == "__main__":
    unittest.main()
