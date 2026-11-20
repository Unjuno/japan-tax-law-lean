"""Regression tests for the deterministic unfinished-obligation selector.

The selector must prefer computable units, stay deterministic, respect ownership
and dependency readiness, and never treat human legal review as a filter.
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))

import task_selector as selector  # noqa: E402


def unit(uid, law="L1", frag="", deps=None, owner="", status="NOT_STARTED",
         unhandled=None):
    return {
        "id": uid, "normative_id": uid, "law_id": law, "status": status,
        "norm_fragment": frag, "dependencies": deps or [], "owner": owner,
        "unhandled_conditions": unhandled or [], "evidence": {},
    }


class ComputableRankingTests(unittest.TestCase):
    def test_computable_marker_scoring(self):
        self.assertEqual(selector.computable(unit("a", frag="")), 0)
        self.assertGreater(selector.computable(unit("b", frag="税率百分の十")), 1)

    def test_prefers_computable_within_a_law(self):
        tasks = [unit("plain", frag=""),
                 unit("math", frag="課税価格から六十万円を控除する")]
        report = selector.select_tasks(tasks, 2)
        self.assertEqual(report["selected"][0]["normative_id"], "math")

    def test_round_robin_is_deterministic(self):
        tasks = [unit("a1", "L1"), unit("a2", "L1"),
                 unit("b1", "L2"), unit("b2", "L2")]
        first = [s["normative_id"] for s in selector.select_tasks(tasks, 4)["selected"]]
        second = [s["normative_id"] for s in selector.select_tasks(tasks, 4)["selected"]]
        self.assertEqual(first, second)
        self.assertEqual(first[0][0], "a")
        self.assertEqual(first[1][0], "b")

    def test_owner_and_dependency_are_respected(self):
        tasks = [unit("claimed", owner="ALICE"),
                 unit("blocked", deps=[{"type": "law_id", "law_id": "L9",
                                        "resolution": "unresolved_underdetermined",
                                        "sufficient": False}]),
                 unit("free")]
        ids = [s["normative_id"] for s in selector.select_tasks(tasks, 3)["selected"]]
        self.assertEqual(ids, ["free"])

    def test_legal_review_is_not_a_filter(self):
        tasks = [unit("a")]
        report = selector.select_tasks(tasks, 1)
        self.assertEqual(report["selected"][0]["legal_review"], "LEGAL_REVIEW_PENDING")


if __name__ == "__main__":
    unittest.main()
