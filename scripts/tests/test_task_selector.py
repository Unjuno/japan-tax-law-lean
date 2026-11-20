#!/usr/bin/env python3
"""Regression tests for the Coordinator's task selector (Directive §3/§4).

Covers the v3 ``text`` field contract for computable ranking, deterministic
round-robin ordering, and the ownership / dependency / legal-review policy.
"""
from __future__ import annotations

import unittest

from scripts.ci import normative_core as nc
from scripts.ci import task_selector as ts


def unit(uid, law="L-A", frag="", text=None, status=nc.STATUS_NOT_STARTED,
         deps=None, owner="", unhandled=None):
    d = {
        "id": uid,
        "normative_id": uid,
        "law_id": law,
        "article": "第一条",
        "status": status,
        "norm_fragment": frag,
        "dependencies": deps or [],
        "unhandled_conditions": unhandled or [],
        "owner": owner,
        "legal_review": nc.LEGAL_REVIEW_PENDING,
    }
    if text is not None:
        d["text"] = text
    return d


class ComputableRankingTests(unittest.TestCase):
    def test_v3_text_field_is_scored(self):
        u = unit("a", text="課税標準に百分の十を乗じて税額を算出する")
        self.assertGreater(ts.computable(u), 0)

    def test_legacy_fragment_still_scored(self):
        self.assertGreater(ts.computable(unit("a", frag="税率百分の十")), 0)

    def test_selector_prefers_computable_unit(self):
        tasks = [unit("NORM|" + "0" * 64, frag="これは手続に関する規定である。"),
                 unit("NORM|" + "1" * 64,
                      frag="課税標準に百分の十を乗じて税額を算出する。")]
        report = ts.select_tasks(tasks, 1)
        self.assertEqual(report["selected_count"], 1)
        self.assertEqual(report["selected"][0]["normative_id"], "NORM|" + "1" * 64)

    def test_computable_counts_diagnostic_markers(self):
        self.assertGreater(ts.computable(unit("u", frag="税率百分の十、控除千円")), 0)
        self.assertEqual(ts.computable(unit("u", frag="手続に関する届出")), 0)

    def test_within_law_prefers_more_computable_units(self):
        low = unit("low", frag="届出")
        high = unit("high", frag="税率百分の十の控除")
        ordered = ts.round_robin([low, high])
        self.assertEqual(ordered[0]["id"], "high")
        self.assertEqual(ordered[1]["id"], "low")

    def test_round_robin_is_deterministic_and_interleaves_laws(self):
        tasks = [unit(f"{law}-{i}", law=law, frag="")
                 for law in ("L-B", "L-A") for i in (1, 2)]
        first = [t["id"] for t in ts.round_robin(tasks)]
        self.assertEqual(first, [t["id"] for t in ts.round_robin(list(reversed(tasks)))])
        self.assertEqual(first[0], "L-A-1")
        self.assertEqual(first[1], "L-B-1")

    def test_tie_break_is_stable_by_id(self):
        tasks = [unit("b", law="L-A"), unit("a", law="L-A")]
        self.assertEqual([t["id"] for t in ts.round_robin(tasks)], ["a", "b"])


class SelectionPolicyTests(unittest.TestCase):
    def test_only_unfinished_unowned_units_are_selected(self):
        tasks = [
            unit("done", status=nc.STATUS_FULLY_VERIFIED),
            unit("owned", owner="FORMALIZE"),
            unit("free"),
        ]
        result = ts.select_tasks(tasks, 5)
        self.assertEqual([s["task_id"] for s in result["selected"]], ["free"])

    def test_legal_review_is_never_a_filter(self):
        result = ts.select_tasks([unit("free")], 5)
        self.assertTrue(result["legal_review_is_not_a_filter"])
        self.assertEqual(result["selected_count"], 1)
        self.assertEqual(result["selected"][0]["legal_review"], nc.LEGAL_REVIEW_PENDING)

    def test_unresolved_bare_id_dependency_blocks_law_and_units(self):
        dep = {"type": "law_id_hint", "law_id": "B-LAW",
               "resolution": "unresolved_underdetermined", "sufficient": False}
        tasks = [unit("a1", law="L-A", deps=[dep]), unit("a2", law="L-A"),
                 unit("b1", law="B-LAW")]
        result = ts.select_tasks(tasks, 10)
        self.assertEqual([s["task_id"] for s in result["selected"]], ["a2"])
        self.assertEqual(result["selectable"], 1)

    def test_evidence_axes_are_reported_as_remaining(self):
        result = ts.select_tasks([unit("free")], 1)
        self.assertEqual(set(result["selected"][0]["remaining_axes"]),
                         set(nc.EVIDENCE_AXES))


if __name__ == "__main__":
    unittest.main()
