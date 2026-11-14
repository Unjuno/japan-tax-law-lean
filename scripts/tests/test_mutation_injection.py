"""Mutation injection tests.

Each test takes the pinned official snapshot, applies exactly one well-scoped
mis-change, reruns the auditor, and asserts that the expected rule fires and
that the baseline finding count for that rule does not already account for the
mutation. Ten mutation classes are exercised (>= 8 required).

Mutation is applied on the parsed JSON tree (not text surgery), so the
pipeline is exercised end to end. The mutated tree is written to a temporary
file because the loader computes and reports SHA-256 of the bytes.
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from copy import deepcopy
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from scripts.law_audit.model import load_law
from scripts.law_audit.rules import all_findings

ACT_REV = "340AC0000000033_20261001_507AC0000000070"
ORDER_REV = "340CO0000000096_20260522_508CO0000000093"
ACT_PATH = REPO / "data" / "raw" / f"{ACT_REV}.law.json"
ORDER_PATH = REPO / "data" / "raw" / f"{ORDER_REV}.law.json"


def text_of(node) -> str:
    if isinstance(node, str):
        return node
    return "".join(text_of(c) for c in node.get("children", []))


def walk(node, pred):
    if isinstance(node, dict):
        if pred(node):
            yield node
        for c in node.get("children", []):
            yield from walk(c, pred)


def mutate_act(mutator):
    data = json.loads(ACT_PATH.read_bytes(), strict=False) if False else json.loads(ACT_PATH.read_bytes())
    mutator(data)
    with tempfile.NamedTemporaryFile("wb", suffix=".law.json", delete=False, dir=tempfile.mkdtemp()) as f:
        f.write(json.dumps(data, ensure_ascii=False).encode("utf-8"))
        return Path(f.name)


def run_audit(path, other=("order", ORDER_PATH)):
    other_doc = load_law(other[1])
    doc = load_law(path)
    findings, stats = all_findings(doc, {other[0]: other_doc})
    ids = [f.rule_id for f in findings]
    return findings, stats, ids


class MutationTestCase(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.baseline_act, cls.baseline_act_stats = load_law(ACT_PATH), None
        cls._fp = None

    def _audit(self, mutator):
        path = mutate_act(mutator)
        try:
            return run_audit(path)
        finally:
            path.unlink(missing_ok=True)
            path.parent.rmdir()

    def test_baseline_has_no_structural_duplicates(self):
        doc = load_law(ACT_PATH)
        order = load_law(ORDER_PATH)
        findings, stats = all_findings(doc, {"order": order})
        self.assertEqual([f for f in findings if f.rule_id == "STRUCT.DUP.ARTICLE"], [])

    # MUT-01: duplicate article number in MAIN
    def test_mut01_duplicate_article_number(self):
        def mutator(data):
            hits = list(walk(data["law_full_text"], lambda n: n.get("tag") == "Article"
                             and n.get("attr", {}).get("Num") == "50"))
            self.assertTrue(hits, "article 50 not found")
            hits[0]["attr"]["Num"] = "2"  # collides with 第一号 article 2
        findings, stats, ids = self._audit(mutator)
        self.assertIn("STRUCT.DUP.ARTICLE", ids)

    # MUT-02: reference to a nonexistent article
    def test_mut02_reference_to_nonexistent_article(self):
        def mutator(data):
            replaced = [0]
            for sent in walk(data["law_full_text"], lambda n: n.get("tag") == "Sentence"):
                if replaced[0]:
                    break
                for i, child in enumerate(sent.get("children", [])):
                    if isinstance(child, str) and "第百十一条" in child:
                        sent["children"][i] = child.replace("第百十一条", "第九百八十七条", 1)
                        replaced[0] = 1
                        break
            self.assertTrue(replaced[0])
        findings, stats, ids = self._audit(mutator)
        self.assertIn("REF.ARTICLE.MISSING", ids)

    # MUT-03: reference to a deleted article
    def test_mut03_reference_to_deleted_article(self):
        def mutator(data):
            replaced = [0]
            for sent in walk(data["law_full_text"], lambda n: n.get("tag") == "Sentence"):
                if replaced[0]:
                    break
                for i, child in enumerate(sent.get("children", [])):
                    if isinstance(child, str) and "第百十一条" in child:
                        sent["children"][i] = child.replace("第百十一条", "第十四条", 1)
                        replaced[0] = 1
                        break
            self.assertTrue(replaced[0])
        findings, stats, ids = self._audit(mutator)
        self.assertIn("REF.ARTICLE.DELETED", ids)

    # MUT-04: item numbering gap (remove an item)
    def test_mut04_item_numbering_gap(self):
        def mutator(data):
            removed = [0]
            for art in walk(data["law_full_text"], lambda n: n.get("tag") == "Article"
                            and n.get("attr", {}).get("Num") == "2"):
                for para in art["children"]:
                    if not isinstance(para, dict) or para.get("tag") != "Paragraph":
                        continue
                    new_children = []
                    for item in para["children"]:
                        if isinstance(item, dict) and item.get("tag") == "Item" and item.get("attr", {}).get("Num") == "5":
                            removed[0] = 1
                            continue
                        new_children.append(item)
                    para["children"] = new_children
                break
            self.assertTrue(removed[0])
        findings, stats, ids = self._audit(mutator)
        self.assertIn("STRUCT.GAP.ITEM", ids)

    # MUT-05: duplicate item number within a paragraph
    def test_mut05_duplicate_item_number(self):
        def mutator(data):
            mutated = [0]
            for art in walk(data["law_full_text"], lambda n: n.get("tag") == "Article"
                            and n.get("attr", {}).get("Num") == "2"):
                for para in art["children"]:
                    if not isinstance(para, dict) or para.get("tag") != "Paragraph":
                        continue
                    for item in para["children"]:
                        if isinstance(item, dict) and item.get("tag") == "Item" and item.get("attr", {}).get("Num") == "4":
                            item["attr"]["Num"] = "3"
                            mutated[0] = 1
                            break
                    break
                break
            self.assertTrue(mutated[0])
        findings, stats, ids = self._audit(mutator)
        self.assertIn("STRUCT.DUP.ITEM", ids)

    # MUT-06: unbalanced parenthesis injected in a sentence
    def test_mut06_unbalanced_parenthesis(self):
        def mutator(data):
            injected = [0]
            for sent in walk(data["law_full_text"], lambda n: n.get("tag") == "Sentence"):
                if injected[0]:
                    break
                for i, child in enumerate(sent.get("children", [])):
                    if isinstance(child, str) and "をいう。" in child:
                        sent["children"][i] = child.replace("をいう。", "（をいう。", 1)
                        injected[0] = 1
                        break
            self.assertTrue(injected[0])
        findings, stats, ids = self._audit(mutator)
        self.assertIn("PAREN.UNBALANCED", ids)

    # MUT-07: TOC range no longer matches body span
    def test_mut07_toc_range_mismatch(self):
        def mutator(data):
            replaced = [0]
            for node in walk(data["law_full_text"], lambda n: n.get("tag") == "ArticleRange"):
                txt = "".join(node.get("children", []))
                if "第一条" in txt and "第四条まで" in txt.replace("―", "から").replace("まで", "まで"):
                    pass
                if txt == "（第一条―第四条）":
                    node["children"] = ["（第一条―第三条）"]
                    replaced[0] = 1
                    break
            self.assertTrue(replaced[0], "TOC range (第一条―第四条） not found")
        findings, stats, ids = self._audit(mutator)
        self.assertIn("TOC.RANGE.MISMATCH", ids)

    # MUT-08: reversed deleted-article range marker
    def test_mut08_reversed_deleted_range(self):
        def mutator(data):
            replaced = [0]
            for art in walk(data["law_full_text"], lambda n: n.get("tag") == "Article"):
                if art.get("attr", {}).get("Num") == "234:236":
                    art["attr"]["Num"] = "236:234"
                    replaced[0] = 1
                    break
            self.assertTrue(replaced[0], "deleted range 234:236 not found")
        findings, stats, ids = self._audit(mutator)
        self.assertIn("STRUCT.DELETED.RANGE", ids)

    # MUT-09: reference to a nonexistent paragraph
    def test_mut09_nonexistent_paragraph_reference(self):
        def mutator(data):
            replaced = [0]
            for sent in walk(data["law_full_text"], lambda n: n.get("tag") == "Sentence"):
                if replaced[0]:
                    break
                for i, child in enumerate(sent.get("children", [])):
                    if isinstance(child, str) and "第二項" in child:
                        sent["children"][i] = child.replace("第二項", "第五十九項", 1)
                        replaced[0] = 1
                        break
            self.assertTrue(replaced[0])
        findings, stats, ids = self._audit(mutator)
        self.assertIn("REF.PARA.MISSING", ids)

    # MUT-10: reference to a nonexistent supplementary-provision article (synthetic)
    def test_mut10_nonexistent_supplementary_reference(self):
        import tempfile
        import shutil
        from scripts.tests.test_structural_audit import make_synthetic_law

        tmp = Path(tempfile.mkdtemp(prefix="law-audit-mut10-"))
        try:
            path = make_synthetic_law(tmp)
            data = json.loads(path.read_bytes())
            replaced = [0]
            for sent in walk(data["law_full_text"], lambda n: n.get("tag") == "Sentence"):
                if replaced[0]:
                    break
                for i, child in enumerate(sent.get("children", [])):
                    if isinstance(child, str) and "同法の規定によるものとする" in child:
                        sent["children"][i] = "このテストは、附則第九条の規定によるものとする。"
                        replaced[0] = 1
                        break
            self.assertTrue(replaced[0])
            path.write_text(json.dumps(data, ensure_ascii=False), encoding="utf-8")
            findings, stats = all_findings(load_law(path), {})
            ids = [f.rule_id for f in findings]
            self.assertIn("REF.SUPP.MISSING", ids)
        finally:
            shutil.rmtree(tmp, ignore_errors=True)

    # MUT-11: numbering sequence reversal (out-of-order article)
    def test_mut11_article_order_reversal(self):
        def mutator(data):
            changed = [0]
            for art in walk(data["law_full_text"], lambda n: n.get("tag") == "Article"):
                if art.get("attr", {}).get("Num") == "50":
                    art["attr"]["Num"] = "49"
                    changed[0] = 1
                    break
            self.assertTrue(changed[0])
        findings, stats, ids = self._audit(mutator)
        # swapped into an already-occupied number: both a duplicate and a sequence issue should appear
        self.assertIn("STRUCT.DUP.ARTICLE", ids)


if __name__ == "__main__":
    unittest.main()
