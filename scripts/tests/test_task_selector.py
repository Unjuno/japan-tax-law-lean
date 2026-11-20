"""Tests for the deterministic task-selector policy (Sponsor Directive §3/§4).

Synthetic tasks only; no repository data or network access.
"""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MODULE = REPO / "scripts" / "ci" / "task_selector.py"
spec = importlib.util.spec_from_file_location("task_selector_under_test", MODULE)
SEL = importlib.util.module_from_spec(spec)
spec.loader.exec_module(SEL)


def task(uid, law, text="", status="NOT_STARTED", deps=None, owner=""):
    return {
        "id": uid, "normative_id": uid, "law_id": law, "article": "1",
        "status": status, "norm_fragment": text, "dependencies": deps or [],
        "unhandled_conditions": [], "owner": owner,
    }


class ComputableTests(unittest.TestCase):
    def test_computable_markers(self):
        self.assertEqual(SEL.computable(task("a", "L", "税率百分の十")), 2)
        self.assertEqual(SEL.computable(task("b", "L", "抽象的な規定")), 0)

    def test_round_robin_interleaves_laws(self):
        tasks = [
            task("a1", "A", "税率"), task("a2", "A", "控除"),
            task("b1", "B", "税率"), task("b2", "B", "控除"),
        ]
        order = [t["id"] for t in SEL.round_robin(tasks)]
        self.assertEqual([order[0], order[2]], ["a1", "a2"])
        self.assertEqual([order[1], order[3]], ["b1", "b2"])

    def test_round_robin_prefers_computable_within_law(self):
        tasks = [task("plain", "A", ""), task("calc", "A", "税率円")]
        self.assertEqual(SEL.round_robin(tasks)[0]["id"], "calc")


class SelectionTests(unittest.TestCase):
    def test_selects_only_unfinished_unowned(self):
        tasks = [
            task("free", "A"),
            task("done", "B", status="FULLY_VERIFIED"),
            task("owned", "C", owner="FORMALIZE"),
        ]
        got = SEL.select_tasks(tasks, 5)
        self.assertEqual([s["task_id"] for s in got["selected"]], ["free"])

    def test_legal_review_is_not_a_filter(self):
        # A unit with pending legal review but no technical blocker is still
        # selectable; legal review lives on a separate axis.
        t = task("pending", "A")
        t["legal_review"] = "LEGAL_REVIEW_PENDING"
        self.assertEqual([s["task_id"] for s in SEL.select_tasks([t], 1)["selected"]], ["pending"])

    def test_unresolved_bare_id_dependency_blocks(self):
        dep = {"type": "LAW_ID_HINT", "law_id": "B", "unresolved": True}
        tasks = [task("ref", "A", deps=[dep]), task("b1", "B")]
        got = SEL.select_tasks(tasks, 5)
        self.assertNotIn("ref", [s["task_id"] for s in got["selected"]])
        self.assertNotIn("b1", [s["task_id"] for s in got["selected"]],
                         "all units of the referenced law are withheld")

    def test_limit_is_respected(self):
        tasks = [task(f"t{i}", chr(65 + i)) for i in range(5)]
        self.assertEqual(len(SEL.select_tasks(tasks, 2)["selected"]), 2)


if __name__ == "__main__":
    unittest.main()
