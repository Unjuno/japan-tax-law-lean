"""Regression tests for resolving the queue's structural source_path.

Pinned source positions must be found by article/paragraph/sentence position,
not by searching for the sentence text. These synthetic trees reproduce the
two path shapes seen in real e-Gov snapshots: nested MainProvision wrappers
and sibling-indexed Supplementary provisions.
"""
from __future__ import annotations

import unittest

from scripts.ci.batch_table_reading_pipeline import resolve_all, flat


def node(tag: str, num: str | None = None, children=None) -> dict:
    attr = {"Num": num} if num is not None else {}
    return {"tag": tag, "attr": attr, "children": children or []}


def article(num: str, sentence: str, paragraph_num: str = "2") -> dict:
    return node("Article", num, [
        node("Paragraph", paragraph_num, [
            node("ParagraphSentence", None, [node("Sentence", "1", [sentence])])])])


class TestStructuralPath(unittest.TestCase):
    def setUp(self):
        self.doc = {"law_full_text": node("Law", None, [
            node("LawNum", None, ["実験法"]),
            node("LawBody", None, [
                node("LawTitle", None, ["実験法"]),
                node("TOC", None, []),
                node("MainProvision", None, [
                    node("Chapter", "1", [node("Section", "1", [article("15_5", "本文A")])]),
                ]),
                node("SupplProvision", None, [
                    node("SupplProvisionLabel", None, ["附"]),
                    node("SupplProvision", None, [article("17_2", "本文B", "6")]),
                ]),
            ]),
        ])}

    def test_nested_main_provision_path(self):
        path = "LawBody[2]/MainProvision/MainProvision[0]/Article:15_5/Article#15_5/Paragraph#2/ParagraphSentence/Sentence#1"
        hits = resolve_all(self.doc, path)
        self.assertEqual(len(hits), 1)
        self.assertEqual(flat(hits[0]), "本文A")

    def test_sibling_index_supplementary_path(self):
        path = "LawBody[3]/SupplProvision/SupplProvision[1]/Article:17_2/Article#17_2/Paragraph#6/ParagraphSentence/Sentence#1"
        hits = resolve_all(self.doc, path)
        self.assertEqual(len(hits), 1)
        self.assertEqual(flat(hits[0]), "本文B")

    def test_wrong_paragraph_number_finds_nothing(self):
        path = "LawBody[2]/MainProvision/MainProvision[0]/Article:15_5/Article#15_5/Paragraph#3/ParagraphSentence/Sentence#1"
        self.assertEqual(resolve_all(self.doc, path), [])

    def test_ambiguous_unindexed_path_is_rejected(self):
        # Both Supplementary provisions carry an Article 1; without a sibling
        # index the resolver must NOT silently pick one.
        doc = {"law_full_text": node("Law", None, [
            node("LawBody", None, [
                node("SupplProvision", None, [article("1", "X")]),
                node("SupplProvision", None, [article("1", "Y")]),
            ])])}
        path = "LawBody/SupplProvision/Article:1/Article#1/Paragraph#2/ParagraphSentence/Sentence#1"
        self.assertGreater(len(resolve_all(doc, path)), 1)


if __name__ == "__main__":
    unittest.main()
