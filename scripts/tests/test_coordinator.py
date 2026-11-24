#!/usr/bin/env python3
"""Coordinator tests: role separation, durable claims, never auto-complete."""
from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ci"
sys.path.insert(0, str(SCRIPT))
import coordinator as coord  # noqa: E402


def unit(uid: str, law: str = "LAW-A", status: str = "NOT_STARTED") -> dict:
    return {
        "id": uid, "normative_id": uid, "law_id": law, "article": "1",
        "status": status, "dependencies": [], "unhandled_conditions": [],
        "text": "税率 百分の十", "owner": "",
    }


class CoordinatorTests(unittest.TestCase):
    def test_three_distinct_roles_per_unit(self):
        claims = coord.load_claims(Path(tempfile.mktemp()))
        out = coord.assign([unit("u1")], claims, 1, write=False)
        self.assertEqual(out["assignment_count"], 3)
        self.assertEqual(len({a["role"] for a in out["assignments"]}), 3)
        self.assertEqual(len({a["owner"] for a in out["assignments"]}), 3)
        self.assertEqual(len({a["phase"] for a in out["assignments"]}), 3)

    def test_legal_review_never_auto_satisfied(self):
        claims = coord.load_claims(Path(tempfile.mktemp()))
        out = coord.cycle([unit("u1")], claims, 1, write=False)
        self.assertTrue(out["cycle"]["assign"]["legal_review"].startswith(
            "LEGAL_REVIEW_PENDING"))
        self.assertFalse(out["cycle"]["assign"]["dry_run"] is None)
        self.assertFalse(out["cycle"]["inspect"]["completion_is_not_declared"] is False)

    def test_claims_prevent_reselection(self):
        with tempfile.TemporaryDirectory() as d:
            path = Path(d) / "claims.json"
            claims = coord.load_claims(path)
            coord.assign([unit("u1")], claims, 1, write=True, path=path)
            saved = coord.load_claims(path)
            self.assertEqual(len(saved["claims"]), 3)
            again = coord.select([unit("u1"), unit("u2")], saved, 5)
            ids = {u["task_id"] for u in again["units"]}
            self.assertNotIn("u1", ids)
            self.assertIn("u2", ids)

    def test_release_restores_selectability(self):
        with tempfile.TemporaryDirectory() as d:
            path = Path(d) / "claims.json"
            claims = coord.load_claims(path)
            coord.assign([unit("u1")], claims, 1, write=True, path=path)
            saved = coord.load_claims(path)
            for cid in list(saved["claims"]):
                coord.release(cid, saved, write=True, path=path)
            saved2 = coord.load_claims(path)
            self.assertTrue(all(not c["active"] for c in saved2["claims"].values()))
            again = coord.select([unit("u1")], saved2, 5)
            self.assertIn("u1", {u["task_id"] for u in again["units"]})

    def test_blocked_unit_does_not_stop_others(self):
        blocked = unit("blocked", "LAW-B")
        blocked["dependencies"] = [{"type": "LAW_ID_HINT", "unresolved": True,
                                    "law_id": "LAW-B"}]
        claims = coord.load_claims(Path(tempfile.mktemp()))
        out = coord.select([blocked, unit("ok", "LAW-C")], claims, 5)
        ids = {u["task_id"] for u in out["units"]}
        self.assertIn("ok", ids)
        self.assertNotIn("blocked", ids)

    def test_cycle_records_measurable_progress_only(self):
        claims = coord.load_claims(Path(tempfile.mktemp()))
        out = coord.cycle([unit("u1")], claims, 1, write=False)
        progress = out["cycle"]["measurable_progress"]
        self.assertEqual(progress["units_selected"], 1)
        self.assertFalse(progress["status_changed_by_coordinator"])


if __name__ == "__main__":
    unittest.main()
