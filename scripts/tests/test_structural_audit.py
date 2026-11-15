"""Structural audit tests.

Three layers:
  1. Unit tests of pure helpers (kanji numerals, branch tails, key parsing).
  2. Synthetic-document tests via a tiny hand-built law tree, where each rule
     is exercised in isolation (positive and negative controls).
  3. Integration tests on the pinned official snapshots: provenance, counts,
     and the absence/presence of specific finding classes.
"""

from __future__ import annotations

import hashlib
import json
import sys
import tempfile
import unittest
from copy import deepcopy
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from scripts.law_audit import kansuji
from scripts.law_audit.model import (
    ArticleKey,
    _parse_article_num,
    _parse_item_num,
    load_law,
)
from scripts.law_audit.rules import (
    all_findings,
    kanji_to_int,
    _parse_branch_tail,
    _mask_quoted,
    _is_link,
    _sentence_split,
    _resolve_article,
    _item_in_article,
)

ACT_REV = "340AC0000000033_20261001_507AC0000000070"
ORDER_REV = "340CO0000000096_20260522_508CO0000000093"
ACT_PATH = REPO / "data" / "raw" / f"{ACT_REV}.law.json"
ORDER_PATH = REPO / "data" / "raw" / f"{ORDER_REV}.law.json"


class TestKansuji(unittest.TestCase):
    def test_single_digits(self):
        for s, n in [("一", 1), ("二", 2), ("三", 3), ("九", 9), ("〇", 0), ("十", 10)]:
            self.assertEqual(kansuji.kanji_to_int(s), n)

    def test_compound(self):
        for s, n in [("十一", 11), ("十九", 19), ("十九", 19), ("二十", 20), ("三十三", 33),
                     ("九十九", 99), ("百", 100), ("百十一", 111), ("百九十二", 192),
                     ("二百三十四", 234), ("九百九十九", 999), ("千", 1000), ("千三百五", 1305),
                     ("二千二百二十三", 2223), ("百六十五", 165)]:
            self.assertEqual(kansuji.kanji_to_int(s), n)

    def test_ascii_digits(self):
        self.assertEqual(kansuji.kanji_to_int("123"), 123)
        self.assertEqual(kansuji.kanji_to_int("０１２３"), 123)
        self.assertEqual(kansuji.kanji_to_int("第1条"[1:2]), 1)

    def test_invalid(self):
        with self.assertRaises(ValueError):
            kansuji.kanji_to_int("")
        with self.assertRaises(ValueError):
            kansuji.kanji_to_int("abc")
        with self.assertRaises(ValueError):
            kansuji.kanji_to_int("ＡＢＣ")

    def test_branch_tail(self):
        self.assertIsNone(_parse_branch_tail(""))
        self.assertEqual(_parse_branch_tail("の五"), (5,))
        self.assertEqual(_parse_branch_tail("の五の二"), (5, 2))
        self.assertEqual(_parse_branch_tail("の一の二の三"), (1, 2, 3))


class TestKeyParsing(unittest.TestCase):
    def test_article_simple(self):
        self.assertEqual(_parse_article_num("2"), [ArticleKey(2, None)])

    def test_article_branch(self):
        keys = _parse_article_num("8_2")
        self.assertEqual(keys, [ArticleKey(8, (2,))])

    def test_article_double_branch(self):
        keys = _parse_article_num("165_5_2")
        self.assertEqual(keys, [ArticleKey(165, (5, 2))])

    def test_article_deleted_range(self):
        keys = _parse_article_num("96:101")
        self.assertEqual((keys[0].integer, keys[-1].integer), (96, 101))
        self.assertEqual(len(keys), 6)

    def test_item_simple(self):
        deleted, keys = _parse_item_num("3")
        self.assertFalse(deleted)
        self.assertEqual(keys, [(3, None)])

    def test_item_branch(self):
        deleted, keys = _parse_item_num("33_2")
        self.assertFalse(deleted)
        self.assertEqual(keys, [(33, (2,))])

    def test_item_deleted_range(self):
        deleted, keys = _parse_item_num("2:4")
        self.assertTrue(deleted)
        self.assertEqual(keys, [(2, None), (3, None), (4, None)])


class TestHelpers(unittest.TestCase):
    def test_mask_quoted(self):
        masked, unterm, unmatched = _mask_quoted("「abc」def（x）")
        self.assertNotIn("a", masked)
        self.assertEqual(masked.count("x"), 1)
        self.assertEqual(unterm, [])
        self.assertEqual(unmatched, [])

    def test_mask_unterminated(self):
        masked, unterm, unmatched = _mask_quoted("「abc")
        self.assertEqual(len(unterm), 1)

    def test_mask_unmatched_close(self):
        masked, unterm, unmatched = _mask_quoted("abc」")
        self.assertEqual(len(unmatched), 1)

    def test_link_ok(self):
        for ok in ["", "から", "まで", "又は", "、", "の", "及び", "若しくは", "（）", "五", "０", "10", "、から"]:
            self.assertTrue(_is_link(ok), ok)
        for bad in ["の規定による", "第百二十条", "もの"]:
            self.assertFalse(_is_link(bad), bad)

    def test_sentence_split_respects_parens(self):
        text = "前項の規定（括弧の中。の文。）は、次の各号による。次条は読まない。"
        sentences = _sentence_split(text)
        self.assertTrue(any("前項" in s for _, s in sentences))
        self.assertTrue(any("次条" in s for _, s in sentences))
        # 括弧内の句点は文境界にしない
        self.assertFalse(any(s == "括弧の中。" for _, s in sentences))

    def test_sentence_split_respects_quotes(self):
        text = "「読替え文中の句点。」とあるのは、「次の文」という。第三者。"
        sentences = _sentence_split(text)
        self.assertTrue(any("第三者" in s for _, s in sentences))


class TestRealLaws(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.act = load_law(ACT_PATH)
        cls.order = load_law(ORDER_PATH)
        cls.fa, cls.sa = all_findings(cls.act, {"order": cls.order})
        cls.fo, cls.so = all_findings(cls.order, {"act": cls.act})

    def test_act_articles_count(self):
        self.assertEqual(self.act.main and len(self.act.main.articles), 302)
        self.assertEqual(sum(len(s.articles) for s in self.act.scopes), 1286)

    def test_order_articles_count(self):
        self.assertEqual(sum(len(s.articles) for s in self.order.scopes), 1142)

    def test_act_sha256(self):
        self.assertEqual(self.act.sha256, "94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B")

    def test_order_sha256(self):
        self.assertEqual(self.order.sha256, "9FACF2E2768D602CCDBBF9891DF142D3A3E7EAD09033EB0634DE00A4C4181392")

    def test_act_deleted_ranges(self):
        mains = self.act.main.articles
        deleted = [a for a in mains if a.deleted]
        nums = {a.num_attr for a in deleted}
        self.assertIn("96:101", nums)
        self.assertIn("234:236", nums)

    def test_order_deleted_ranges(self):
        mains = self.order.main.articles
        nums = {a.num_attr for a in mains if a.deleted}
        self.assertIn("66:68", nums)
        self.assertIn("227:257", nums)

    def test_no_duplicate_articles(self):
        dup = [f for f in self.fa if f.rule_id == "STRUCT.DUP.ARTICLE"]
        self.assertEqual(dup, [])
        dup = [f for f in self.fo if f.rule_id == "STRUCT.DUP.ARTICLE"]
        self.assertEqual(dup, [])

    def test_act_reference_stats(self):
        self.assertGreater(self.sa.references_internal_checked, 3000)
        self.assertGreater(self.sa.references_external_unverified, 2000)
        self.assertGreater(self.sa.references_unsupported, 4000)

    def test_reported_act_2_items(self):
        art = next(a for a in self.act.main.articles if a.num_attr == "2")
        items = [it.num for p in art.paragraphs for it in p.items if it.level == 0]
        self.assertIn("3", items)  # 居住者
        self.assertIn("5", items)  # 非居住者
        ints = {int(i.split("_")[0]) for i in items}
        self.assertEqual(ints, set(range(1, max(ints) + 1)))

    def test_article_2_content_items(self):
        art = next(a for a in self.act.main.articles if a.num_attr == "2")
        texts = {it.num: it.text for p in art.paragraphs for it in p.items if it.level == 0}
        self.assertIn("国内に住所を有し", texts["3"])
        self.assertIn("居住者以外", texts["5"])

    def test_article_3_content(self):
        art = next(a for a in self.act.main.articles if a.num_attr == "3")
        self.assertIn("国家公務員", art.text)
        self.assertIn("みなして", art.text)

    def test_order_13_to_15_content(self):
        refs = {}
        for a in self.order.main.articles:
            if a.num_attr in ("13", "14", "15"):
                refs[a.num_attr] = a.text
        self.assertIn("永住すると認められる", refs["13"])
        self.assertIn("推定する", refs["14"])
        self.assertIn("推定する", refs["15"])

    def test_audit_cli(self):
        import subprocess
        result = subprocess.run(
            [sys.executable, "-m", "scripts.law_audit.audit", "--out", str(REPO / "build")],
            cwd=REPO, capture_output=True, text=True,
        )
        self.assertEqual(result.returncode, 0, result.stderr + result.stdout)
        self.assertTrue((REPO / "build" / "findings.json").exists())
        self.assertTrue((REPO / "build" / "summary.json").exists())


def make_synthetic_law(tmpdir: Path) -> Path:
    """Minimal synthetic statute with known structure."""
    def article(num, caption, title, paragraphs):
        return {
            "tag": "Article", "attr": {"Num": num},
            "children": ([{"tag": "ArticleCaption", "attr": {}, "children": [caption]}] if caption else [])
            + [{"tag": "ArticleTitle", "attr": {}, "children": [title]}]
            + paragraphs,
        }

    def para(num, text, items=()):
        children = [{"tag": "ParagraphNum", "attr": {}, "children": []},
                    {"tag": "ParagraphSentence", "attr": {}, "children":
                        [{"tag": "Sentence", "attr": {"Num": "1"}, "children": [text]}]}]
        for inum, ititle, itext in items:
            children.append({
                "tag": "Item", "attr": {"Num": inum},
                "children": [{"tag": "ItemTitle", "attr": {}, "children": [ititle]},
                             {"tag": "ItemSentence", "attr": {}, "children":
                                [{"tag": "Sentence", "attr": {"Num": "1"}, "children": [itext]}]}],
            })
        return {"tag": "Paragraph", "attr": {"Num": num}, "children": children}

    tree = {
        "attached_files_info": None,
        "law_info": {"law_id": "TEST0000000000001", "law_num": "令和八年政令第一号",
                     "law_num_era": "Reiwa", "law_num_year": 8, "law_num_type": "CabinetOrder",
                     "law_num_num": "001", "law_type": "CabinetOrder",
                     "promulgation_date": "2026-04-01"},
        "revision_info": {"law_revision_id": "TEST0000000000001_20260401_REV",
                          "law_title": "テスト法令", "current_revision_status": "CurrentEnforced",
                          "amendment_enforcement_date": "2026-04-01"},
        "law_full_text": {
            "tag": "Law",
            "attr": {"Lang": "ja", "LawType": "CabinetOrder"},
            "children": [
                {"tag": "LawNum", "attr": {}, "children": ["令和八年政令第一号"]},
                {"tag": "LawBody", "attr": {}, "children": [
                    {"tag": "LawTitle", "attr": {}, "children": ["テスト法令"]},
                    {"tag": "TOC", "attr": {}, "children": [
                        {"tag": "TOCChapter", "attr": {"Num": "1"}, "children": [
                            {"tag": "ChapterTitle", "attr": {}, "children": ["第一章 テスト"]},
                            {"tag": "ArticleRange", "attr": {}, "children": ["（第一条）"]},
                        ]},
                    ]},
                    {"tag": "MainProvision", "attr": {}, "children": [
                        {"tag": "Chapter", "attr": {"Num": "1"}, "children": [
                            {"tag": "ChapterTitle", "attr": {}, "children": ["第一章 テスト"]},
                            article("1", "（テスト）", "第一条", [para("1", "このテストは、同法の規定によるものとする。", [("1", "一", "最初の号。"), ("2", "二", "二番目の号。")])]),
                        ]},
                    ]},
                    {"tag": "SupplProvision", "attr": {"Num": "1"}, "children": [
                        {"tag": "SupplProvisionLabel", "attr": {}, "children": ["附"]},
                        {"tag": "SupplProvisionAppdxTable", "attr": {"Num": "1"}, "children": []},
                        article("1", None, "第一条", [para("1", "この附則は、公布の日から施行する。")]),
                    ]},
                ]},
            ],
        },
    }
    path = tmpdir / "synthetic.law.json"
    path.write_text(json.dumps(tree, ensure_ascii=False), encoding="utf-8")
    return path


def make_regression_law(tmpdir: Path) -> Path:
    """Synthetic statute exercising the three audit regressions:
    subitem parsing, branch-number resolution, paragraph-scoped item references."""

    def article(num, caption, title, paragraphs):
        return {
            "tag": "Article", "attr": {"Num": num},
            "children": ([{"tag": "ArticleCaption", "attr": {}, "children": [caption]}] if caption else [])
            + [{"tag": "ArticleTitle", "attr": {}, "children": [title]}]
            + paragraphs,
        }

    def item(num, ititle, itext, subitems=()):
        children = [{"tag": "ItemTitle", "attr": {}, "children": [ititle]},
                    {"tag": "ItemSentence", "attr": {}, "children":
                        [{"tag": "Sentence", "attr": {"Num": "1"}, "children": [itext]}]}]
        for si_num, si_title, si_text in subitems:
            children.append({
                "tag": "Subitem1", "attr": {"Num": si_num},
                "children": [{"tag": "Subitem1Title", "attr": {}, "children": [si_title]},
                             {"tag": "Subitem1Sentence", "attr": {}, "children":
                                 [{"tag": "Sentence", "attr": {"Num": "1"}, "children": [si_text]}]}],
            })
        return {"tag": "Item", "attr": {"Num": num}, "children": children}

    def para(num, text, items=()):
        children = [{"tag": "ParagraphNum", "attr": {}, "children": []},
                    {"tag": "ParagraphSentence", "attr": {}, "children":
                        [{"tag": "Sentence", "attr": {"Num": "1"}, "children": [text]}]}]
        for it in items:
            children.append(it)
        return {"tag": "Paragraph", "attr": {"Num": num}, "children": children}

    tree = {
        "attached_files_info": None,
        "law_info": {"law_id": "TEST0000000000002", "law_num": "テスト令和八年第二号",
                     "law_num_era": "Reiwa", "law_num_year": 8, "law_num_type": "CabinetOrder",
                     "law_num_num": "002", "law_type": "CabinetOrder",
                     "promulgation_date": "2026-04-01"},
        "revision_info": {"law_revision_id": "TEST0000000000002_20260401_REV",
                          "law_title": "テスト法二", "current_revision_status": "CurrentEnforced",
                          "amendment_enforcement_date": "2026-04-01"},
        "law_full_text": {
            "tag": "Law",
            "attr": {"Lang": "ja", "LawType": "CabinetOrder"},
            "children": [
                {"tag": "LawNum", "attr": {}, "children": ["テスト令和八年第二号"]},
                {"tag": "LawBody", "attr": {}, "children": [
                    {"tag": "LawTitle", "attr": {}, "children": ["テスト法二"]},
                    {"tag": "TOC", "attr": {}, "children": [
                        {"tag": "TOCChapter", "attr": {"Num": "1"}, "children": [
                            {"tag": "ChapterTitle", "attr": {}, "children": ["第一章 テスト"]},
                            {"tag": "ArticleRange", "attr": {}, "children": ["（略）"]},
                        ]},
                    ]},
                    {"tag": "MainProvision", "attr": {}, "children": [
                        {"tag": "Chapter", "attr": {"Num": "1"}, "children": [
                            {"tag": "ChapterTitle", "attr": {}, "children": ["第一章 テスト"]},
                            article("20", None, "第二十条", [para("1", "第二十条の本文。")]),
                            article("20_2", None, "第二十条の二", [para("1", "第二十条の二の本文。")]),
                            article("21", None, "第二十一条", [
                                para("1", "第二十一条第一項の本文。", [
                                    item("1", "一", "第一号の規定。"),
                                    item("2", "二", "第二号の規定。"),
                                    item("3", "三", "第三号の規定。"),
                                ]),
                                para("2", "第二十一条第二項の本文。", [
                                    item("1", "一", "第二項第一号の規定。"),
                                ]),
                            ]),
                            article("22", None, "第二十二条", [para("1", "第二十条の五第一項に準じて処理する。")]),
                            article("23", None, "第二十三条", [para("1", "第二十一条第一項第二号に準じて処理する。")]),
                            article("24", None, "第二十四条", [para("1", "第二十一条第二項第二号に準じて処理する。")]),
                            article("25", None, "第二十五条", [
                                para("1", "第二十五条の本文。", [
                                    item("1", "一", "第一号。", subitems=[
                                        ("1", "イ", "イの規定。"),
                                        ("2", "ロ", "ロの規定。"),
                                    ]),
                                ]),
                            ]),
                        ]},
                    ]},
                    {"tag": "SupplProvision", "attr": {"Num": "1"}, "children": [
                        {"tag": "SupplProvisionLabel", "attr": {}, "children": ["付"]},
                        {"tag": "SupplProvisionAppdxTable", "attr": {"Num": "1"}, "children": []},
                        article("1", None, "第一条", [para("1", "この号は省略する。")]),
                    ]},
                ]},
            ],
        },
    }
    path = tmpdir / "regression.law.json"
    path.write_text(json.dumps(tree, ensure_ascii=False), encoding="utf-8")
    return path


class TestRegressionAuditFixes(unittest.TestCase):
    """Regression tests for the three audit-tool defects:
    (A) subitems (イ/ロ/ハ) must be parsed as nested items;
    (B) branch-article resolution must not fall back to base-number candidates;
    (C) an 項-specified 号 reference must resolve within that paragraph only.
    """

    def setUp(self):
        import tempfile
        self.tmp = Path(tempfile.mkdtemp(prefix="law-audit-regress-"))
        self.path = make_regression_law(self.tmp)
        self.doc = load_law(self.path)

    def tearDown(self):
        import shutil
        shutil.rmtree(self.tmp, ignore_errors=True)

    def test_A_subitems_are_parsed(self):
        art25 = next(a for a in self.doc.main.articles
                     if a.keys and a.keys[0].integer == 25)
        levels = [it.level for p in art25.paragraphs for it in p.items]
        self.assertEqual(levels, [0, 1, 1])
        titles = [it.title for p in art25.paragraphs for it in p.items]
        self.assertEqual(titles, ["一", "イ", "ロ"])
        # parent linkage: subitems point at their enclosing item's key
        self.assertIsNone(art25.paragraphs[0].items[0].parent)
        self.assertEqual(art25.paragraphs[0].items[1].parent, "1")
        self.assertEqual(art25.paragraphs[0].items[2].parent, "1")

    def test_A_subitem_numbering_gap_checked_per_parent(self):
        findings, _ = all_findings(self.doc, {})
        dup_gap = [f for f in findings
                   if f.rule_id in ("STRUCT.GAP.ITEM", "STRUCT.DUP.ITEM")]
        for f in dup_gap:
            self.assertNotIn("25", f.path)

    def test_B_branch_missing_not_accepted(self):
        idx = self.doc.article_index()
        self.assertIsNone(_resolve_article(idx, "MAIN", 20, (5,)))

    def test_B_branch_exact_hit(self):
        idx = self.doc.article_index()
        hits = _resolve_article(idx, "MAIN", 20, (2,))
        self.assertIsNotNone(hits)
        self.assertTrue(all(k.branch == (2,) for h in hits for k in h.keys))

    def test_B_no_branch_returns_all_base_candidates(self):
        idx = self.doc.article_index()
        self.assertEqual(len(_resolve_article(idx, "MAIN", 20, None)), 2)

    def test_B_reference_to_missing_branch_article_is_candidate(self):
        findings, _ = all_findings(self.doc, {})
        missing = [f for f in findings if f.rule_id == "REF.ARTICLE.MISSING"]
        self.assertTrue(any("第二十条の五" in f.message for f in missing),
                        [f.message for f in missing])

    def test_C_item_in_specified_paragraph_only(self):
        art21 = next(a for a in self.doc.main.articles
                     if a.keys and a.keys[0].integer == 21)
        # 第二項 has only item 1 — item 2 must not be found there
        self.assertFalse(_item_in_article(art21, 2, None, 2))
        self.assertTrue(_item_in_article(art21, 1, None, 2))
        # 第一項 has items 1-3 — item 2 exists there
        self.assertTrue(_item_in_article(art21, 2, None, 1))
        # unscoped search finds item 2 somewhere in the article
        self.assertTrue(_item_in_article(art21, 2, None, None))

    def test_C_reference_wrong_paragraph_is_candidate(self):
        findings, _ = all_findings(self.doc, {})
        missing_items = [f for f in findings if f.rule_id == "REF.ITEM.MISSING"]
        self.assertTrue(any("paragraph 2" in f.message for f in missing_items),
                        [f.message for f in missing_items])

    def test_C_reference_specified_paragraph_ok(self):
        findings, _ = all_findings(self.doc, {})
        missing_items = [f for f in findings if f.rule_id == "REF.ITEM.MISSING"]
        # 第二十三条の chains (21条1項2号) — item exists in 第一項 → no REF.ITEM.MISSING
        self.assertFalse(any("paragraph 1" in f.message for f in missing_items),
                         [f.message for f in missing_items])


class TestSyntheticLaw(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp(prefix="law-audit-test-"))
        self.path = make_synthetic_law(self.tmp)
        self.doc = load_law(self.path)

    def tearDown(self):
        import shutil
        shutil.rmtree(self.tmp, ignore_errors=True)

    def test_scopes_exist(self):
        names = [s.name for s in self.doc.scopes]
        self.assertIn("MAIN", names)
        self.assertTrue(any(n.startswith("SP:") for n in names))

    def test_synthetic_article_found(self):
        self.assertEqual(self.doc.main.articles[0].num_attr, "1")
        items = [it.num for p in self.doc.main.articles[0].paragraphs for it in p.items]
        self.assertEqual(items, ["1", "2"])

    def test_synthetic_clean_audit(self):
        findings, stats = all_findings(self.doc, {})
        self.assertEqual([f for f in findings if f.rule_id == "STRUCT.DUP.ARTICLE"], [])
        self.assertEqual([f for f in findings if f.rule_id == "STRUCT.DUP.ITEM"], [])
        self.assertEqual([f for f in findings if f.rule_id == "STRUCT.GAP.ITEM"], [])

    def test_synthetic_reference_ok(self):
        findings, stats = all_findings(self.doc, {})
        # 同法 is an external-name marker; nothing internal should be flagged
        internal_missing = [f for f in findings if f.rule_id == "REF.ARTICLE.MISSING"]
        self.assertEqual(internal_missing, [])


if __name__ == "__main__":
    unittest.main()
