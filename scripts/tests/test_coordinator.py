"""Coordinator loop tests (Sponsor Directive §3)."""
import importlib.util
import pathlib
import unittest

REPO = pathlib.Path(__file__).resolve().parents[2]


def load(name: str, rel: str):
    spec = importlib.util.spec_from_file_location(name, REPO / rel)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def task(uid: str, law: str = "340AC0000000034", status: str = "NOT_STARTED", **kw):
    t = {
        "id": uid, "normative_id": uid, "law_id": law, "article": "12",
        "revision": law + "_20260101", "enforcement_date": "2026-01-01",
        "status": status, "text": "税率百分の十の規定", "kind": "CONDITION",
        "dependencies": [], "unhandled_conditions": [], "blockers": [],
        "owner": "", "scope": "COMPUTABLE_SLICE_ONLY", "legal_review": "LEGAL_REVIEW_PENDING",
    }
    t.update(kw)
    return t


class CoordinatorTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.mod = load("coordinator_test", "scripts/ci/coordinator.py")

    def test_loop_order(self):
        self.assertEqual(list(self.mod.LOOP), [
            "INSPECT", "SELECT", "FORMALIZE", "PROVE", "CHALLENGE", "VERIFY",
            "COMMIT", "REPEAT"])

    def test_roles_are_distinct_stages(self):
        self.assertEqual(self.mod.ROLES, ("FORMALIZE", "PROVE", "CHALLENGE", "VERIFY"))

    def test_role_for_missing_axes(self):
        self.assertEqual(self.mod.role_for({}, {}), "FORMALIZE")
        ev = {"source_location": "raw#LawBody/Article:12",
              "independent_spec": "FooSpec.lean", "implementation": "Foo.lean"}
        self.assertEqual(self.mod.role_for({}, ev), "PROVE")
        ev.update({"kernel_proof": "CI success", "proof_scope": "constants",
                   "tests": "kernel-decided"})
        self.assertEqual(self.mod.role_for({}, ev), "CHALLENGE")
        ev.update({"source_correspondence_audit": "scoped", "adversarial_review": "H/T/D/C/U",
                   "boundary_proof": "boundary", "cross_law_proof": "deps=0",
                   "decomposition_audit": "exact"})
        self.assertEqual(self.mod.role_for({}, ev), "VERIFY")

    def test_claims_are_not_assigned_and_blocked_units_do_not_stop_others(self):
        tasks = [task("NORM|b"), task("NORM|c"), task("NORM|d")]
        tasks[0]["status"] = "BLOCKED"
        data = self.mod.run_once(tasks, 2, {"NORM|c": "agent-2"})
        ids = [a["normative_id"] for a in data["assignments"]]
        self.assertNotIn("NORM|b", ids)
        self.assertNotIn("NORM|c", ids)
        self.assertEqual(ids, ["NORM|d"])
        self.assertTrue(data["legal_review_is_not_a_filter"])
        self.assertTrue(data["one_blocked_unit_does_not_stop_others"])

    def test_each_assignment_has_one_role_and_pending_review(self):
        data = self.mod.run_once([task("NORM|1"), task("NORM|2")], 2)
        for assignment in data["assignments"]:
            self.assertIn(assignment["role"], self.mod.ROLES)
            self.assertEqual(assignment["legal_review"], "LEGAL_REVIEW_PENDING")
            self.assertTrue(assignment["checklist"])

    def test_deterministic(self):
        tasks = [task("NORM|1"), task("NORM|2"), task("NORM|3")]
        a = self.mod.run_once(tasks, 3)
        b = self.mod.run_once(tasks, 3)
        self.assertEqual(a["assignments"], b["assignments"])


if __name__ == "__main__":
    unittest.main()
