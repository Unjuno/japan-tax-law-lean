"""Guarded-class tests for table-based 読替え extraction.

The pair parser must follow the pinned table's rowspan structure, keep
context-distinct pairs even when the source phrase repeats, and reject
malformed or unsafe rows. These tests use synthetic tables only; they do not
claim anything about the statute corpus.
"""
from __future__ import annotations

import unittest

from scripts.ci.batch_table_reading_pipeline import parse_pairs, table_rows


def col(text: str, rowspan: int = 1) -> dict:
    return {"tag": "TableColumn", "attr": {"rowspan": str(rowspan)},
            "children": [text]}


def row(*cols: dict) -> dict:
    return {"tag": "TableRow", "attr": {}, "children": list(cols)}


def table(*rows: dict) -> dict:
    return {"tag": "TableStruct", "attr": {}, "children": [
        {"tag": "Table", "attr": {}, "children": list(rows)}]}


class TestTablePairExtraction(unittest.TestCase):
    def test_rowspan_continuation_concatenates_phrases(self):
        ts = table(
            row(col("第十五条第三項", 2), col("金額"), col("金額（政令で定める額）")),
            row(col("できる"), col("する")),
            row(col("第十五条第五項"), col("甲"), col("乙")),
        )
        self.assertEqual(parse_pairs(ts),
                         [("金額できる", "金額（政令で定める額）する"), ("甲", "乙")])

    def test_span3_and_repeated_source_phrase_kept_as_distinct_contexts(self):
        ts = table(
            row(col("上欄一", 3), col("前二条"), col("附則第一条")),
            row(col("の規定"), col("の規定を準用")),
            row(col("中"), col("下")),
            row(col("上欄二"), col("前二条"), col("附則第二条")),
        )
        self.assertEqual(parse_pairs(ts), [
            ("前二条の規定中", "附則第一条の規定を準用下"),
            ("前二条", "附則第二条"),
        ])

    def test_empty_or_identical_pair_rejected(self):
        ts = table(row(col("第一条"), col(""), col("甲")))
        self.assertIsNone(parse_pairs(ts))
        ts = table(row(col("第一条"), col("甲"), col("甲")))
        self.assertIsNone(parse_pairs(ts))

    def test_malformed_shape_rejected(self):
        ts = table(row(col("第一条"), col("甲"), col("乙"), col("丙")))
        self.assertIsNone(parse_pairs(ts))
        ts = table(row(col("第一条", 2), col("甲"), col("乙")))
        self.assertIsNone(parse_pairs(ts))  # dangling continuation

    def test_table_rows_reads_nested_table(self):
        ts = table(row(col("上"), col("中"), col("下")))
        rows = table_rows(ts)
        self.assertEqual(len(rows), 1)
        self.assertEqual([c[0] for c in rows[0]], ["上", "中", "下"])


if __name__ == "__main__":
    unittest.main()
