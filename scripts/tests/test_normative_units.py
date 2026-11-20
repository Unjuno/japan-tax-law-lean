"""Tests for collision-free normative ids, decomposition audit, structured
dependencies and evidence-driven completion (Sponsor Directive §1/§5).

Synthetic inputs only: no network, no repository-side effects.
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))

from normative_units import (  # noqa: E402
    EVIDENCE_KEYS, audit_decomposition, decompose, derive_state,
    extract_dependencies, merge_state, normative_id,
)


def article(num, children):
    return {"tag": "Article", "attr": {"Num": num}, "children": children}


def paragraph(num, text):
    return {"tag": "Paragraph", "attr": {"Num": num},
            "children": [{"tag": "ParagraphText", "children": [text]}]}


def item(num, text):
    return {"tag": "Item", "attr": {"Num": num},
            "children": [{"tag": "ItemText", "children": [text]}]}


class TestNormativeId(unittest.TestCase):
    def test_full_length_and_uniqueness(self):
        a = normative_id("340AC0000000033", "revA", ("本則", "条[2]"), 0, "CONDITION", "text")
        b = normative_id("340AC0000000033", "revB", ("本則", "条[2]"), 0, "CONDITION", "text")
        c = normative_id("340AC0000000033", "revA", ("附則", "条[2]"), 0, "CONDITION", "text")
        d = normative_id("340AC0000000033", "revA", ("本則", "条[2]"), 1, "CONDITION", "text")
        e = normative_id("340AC0000000033", "revA", ("本則", "条[2]"), 0, "EFFECT", "text")
        ids = [a, b, c, d, e]
        self.assertTrue(all(len(x) == 64 for x in ids))
        self.assertEqual(len(set(ids)), 5)

    def test_length_prefix_avoids_delimiter_ambiguity(self):
        a = normative_id("A|B", "C", ("x",), 0, "EFFECT", "t")
        b = normative_id("A", "B|C", ("x",), 0, "EFFECT", "t")
        self.assertNotEqual(a, b)


class TestDecompositionAudit(unittest.TestCase):
    def test_spans_partition_source(self):
        text = "居住者は課税所得に税率を乗じて税額を計算する。ただし除外される場合はこの限りではない。"
        units = decompose(("本則", "条[1]"), text)
        audit = audit_decomposition(text, units)
        self.assertEqual(audit["gap_chars"], 0)
        self.assertEqual(audit["overlap_chars"], 0)
        self.assertEqual(audit["classified_chars"] + audit["unresolved_chars"], len(text))
        self.assertTrue(any(u["kind"] == "EXCEPTION" for u in units))

    def test_unresolved_is_recorded_not_dropped(self):
        text = "甲乙丙丁 abcdef"
        units = decompose(("本則", "条[9]"), text)
        kinds = {u["kind"] for u in units}
        self.assertIn("UNRESOLVED", kinds)
        audit = audit_decomposition(text, units)
        self.assertFalse(audit["decomposition_ok"])
        self.assertGreater(audit["unresolved_chars"], 0)
        self.assertEqual(audit["gap_chars"], 0)

    def test_independent_audit_detects_dropped_span(self):
        text = "居住者は税額を計算する。ただし除外する。"
        units = decompose(("本則", "条[1]"), text)
        truncated = [dict(u) for u in units[:-1]]
        audit = audit_decomposition(text, truncated)
        self.assertFalse(audit["decomposition_ok"])
        self.assertGreater(audit["gap_chars"], 0)

    def test_structural_locator_includes_article_paragraph_item(self):
        from normative_units import iter_blocks
        root = {"tag": "MainProvision", "children": [
            article("2", [paragraph("1", [item("三", "国内に住所を有する場合")])])
        ]}
        blocks = list(iter_blocks(root))
        self.assertTrue(any("本則" in p and "条[2]" in p and "項[1]" in p and "号[三]" in p
                            for p, _, _ in blocks))


class TestDependencies(unittest.TestCase):
    def test_law_name_article_and_revision(self):
        laws = [{
            "law_id": "340AC0000000033",
            "official_title": "所得税法",
            "current_revision": {"law_revision_id": "340AC0000000033_20260401_X"},
        }]
        text = "この法律は所得税法第2条の規定を準用する。政令で定めるところによる。"
        result = extract_dependencies(text, laws)
        self.assertTrue(any(
            d["kind"] == "REFERENCE" and d["law_id"] == "340AC0000000033"
            and d["article"] == "2" and d["resolved"]
            and d["law_revision_id"].endswith("X")
            for d in result["dependencies"]
        ))
        self.assertTrue(any(d["kind"] == "DELEGATION" for d in result["dependencies"]))

    def test_self_references_resolve_against_current_law(self):
        laws = [{"law_id": "L1", "official_title": "所得税法",
                 "current_revision": {"law_revision_id": "r1"}}]
        ctx = {"law_id": "L1", "revision_id": "r1", "article": "5"}
        r = extract_dependencies("前条の規定を準用する。この法律第7条は適用する。",
                                 laws, context=ctx)
        resolved = [d for d in r["dependencies"] if d["resolved"]]
        self.assertTrue(any(d["kind"] == "REFERENCE" and d["article"] == "4" for d in resolved))
        self.assertTrue(any(d["kind"] == "REFERENCE" and d["article"] == "7" for d in resolved))

    def test_bare_15_digit_number_is_not_a_dependency(self):
        result = extract_dependencies("340AC0000000033 を参照する。", [])
        self.assertEqual(result["dependencies"], [])
        self.assertIn("340AC0000000033", result["legacy_raw_ids"])
        self.assertFalse(result["legacy_ids_authoritative"])


class TestCompletionState(unittest.TestCase):
    def _task(self, scope="FULL_ARTICLE", unresolved=False):
        return {
            "scope": scope,
            "unresolved_units": [{"locator": "x"}] if unresolved else [],
            "decomposition": {"audit": {"decomposition_ok": True}},
            "source_sha256": "s" * 64,
        }

    def _record(self):
        return {
            "completion_state": "NOT_STARTED", "blockers": [], "evidence": {},
            "source_sha256": "s" * 64,
        }

    def test_needle_file_and_theorem_name_never_complete(self):
        rec = self._record()
        rec["needle_found"] = True
        rec["file_exists"] = True
        rec["theorem_name_matched"] = True
        self.assertEqual(derive_state(rec, self._task()), "NOT_STARTED")

    def test_partial_then_verified_with_evidence(self):
        rec = self._record()
        rec["evidence"]["implementation"] = {"kind": "implementation", "sha256": "a" * 64}
        self.assertEqual(derive_state(rec, self._task()), "PARTIAL")
        rec["evidence"] = {}
        for key in EVIDENCE_KEYS:
            if key == "proof_result":
                rec["evidence"][key] = {"kind": key, "sha256": "p" * 64,
                                        "kernel_checked": True, "sorry_count": 0,
                                        "admit_count": 0, "unexpected_axiom_count": 0}
            elif key == "boundary_tests":
                rec["evidence"][key] = {"kind": key, "sha256": "t" * 64,
                                        "passed": 3, "test_names": ["edge_1"]}
            else:
                rec["evidence"][key] = {"kind": key, "sha256": key[0] * 64, "author": "A"}
        self.assertEqual(derive_state(rec, self._task()), "FULLY_VERIFIED")
        self.assertEqual(derive_state(rec, self._task(scope="COMPUTABLE_SLICE_ONLY")),
                         "PROVED_SCOPE")

    def test_blocker_and_unresolved_override_evidence(self):
        rec = self._record()
        rec["blockers"] = ["legal_interpretation_required"]
        self.assertEqual(derive_state(rec, self._task()), "BLOCKED")
        rec["blockers"] = []
        self.assertEqual(derive_state(rec, self._task(unresolved=True)), "UNRESOLVED")

    def test_merge_preserves_owner_and_state(self):
        task = {"task_id": "aaa", "source_sha256": "s" * 64,
                "decomposition": {"audit": {"decomposition_ok": True}},
                "scope": "FULL_ARTICLE", "unresolved_units": []}
        state = {"schema": 1, "tasks": {}}
        merge_state(state, [task])
        state["tasks"]["aaa"]["owner"] = "FORMALIZE"
        state["tasks"]["aaa"]["completion_state"] = "PARTIAL"
        merge_state(state, [task])
        self.assertEqual(state["tasks"]["aaa"]["owner"], "FORMALIZE")
        self.assertEqual(state["tasks"]["aaa"]["completion_state"], "PARTIAL")


class TestSelectorDependencies(unittest.TestCase):
    def test_unresolved_and_unproved_dependencies_block(self):
        import task_selector
        target = {
            "law_id": "L1",
            "dependencies": {"dependencies": [
                {"resolved": False, "raw": "未知法第3条"},
                {"resolved": True, "law_id": "L2", "law_revision_id": "r2",
                 "article": "3"},
            ]},
        }
        by_key = {("L2", "3"): [{"law_id": "L2", "revision_id": "r2",
                                   "status": {"completion_state": "NOT_STARTED"}}]}
        reasons = task_selector._dependency_status(target, by_key)
        self.assertEqual(len(reasons), 2)
        self.assertTrue(any("unresolved dependency" in r for r in reasons))
        self.assertTrue(any("not proved" in r for r in reasons))

    def test_intra_statute_dependency_does_not_block(self):
        import task_selector
        target = {
            "law_id": "L1",
            "dependencies": {"dependencies": [
                {"resolved": True, "law_id": "L1", "article": "4"},
            ]},
        }
        self.assertEqual(task_selector._dependency_status(target, {}), [])


if __name__ == "__main__":
    unittest.main()
