"""Regression tests for the canonical normative identity / completion core.

Covers Directive §1 items 1-7: collision-free IDs, decomposition coverage,
structured dependencies, evidence-driven status, durable merge, and the
dependency-aware selector. These tests import the canonical modules directly;
no numeric/file/name presence fact is treated as completion.
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))

import normative_core as core  # noqa: E402
import task_selector  # noqa: E402


BASE = dict(
    law_id="340AC0000000033", history_id="H1", provision="MAIN",
    article="第八十九条", paragraph="1", item="", subitem="", table="",
    row="", cell="", ordinal=0, kind="EFFECT", text="課税価格から六十万円を控除する。",
    provision_no="", source_path="MainProvision/Article#89",
)


class IdentityTests(unittest.TestCase):
    def _id(self, **kw):
        args = dict(BASE)
        args.update(kw)
        return core.make_normative_id(**args)

    def test_id_is_full_sha256_and_collision_free(self):
        uid = self._id()
        self.assertTrue(uid.startswith("NORM|"))
        self.assertEqual(len(uid), len("NORM|") + 64)
        int(uid.split("|")[1], 16)

    def test_each_component_changes_the_id(self):
        fields = ("law_id", "history_id", "provision", "article", "paragraph",
                  "item", "subitem", "table", "row", "cell", "ordinal", "kind",
                  "text", "provision_no", "source_path")
        base = self._id()
        for f in fields:
            kw = {f: 1 if f == "ordinal" else "X"}
            self.assertNotEqual(base, self._id(**kw), f)


class DecompositionTests(unittest.TestCase):
    def test_coverage_exact_and_exceptions_separate(self):
        units = [{"id": "a", "text": "第一項は課する。"},
                 {"id": "b", "text": "ただし、六十万円を控除する。"}]
        audit = core.audit_coverage("".join(u["text"] for u in units), units)
        self.assertEqual(audit["status"], "COVERED")
        self.assertTrue(audit["exact"])
        self.assertTrue(audit["unique_ids"])
        self.assertEqual(core.classify(units[1]["text"])["kind"], "EXCEPTION")

    def test_gap_is_detected(self):
        original = "全文がここにある。"
        units = [{"id": "a", "text": "全文が"}]
        audit = core.audit_coverage(original, units)
        self.assertFalse(audit["exact"])
        self.assertNotEqual(audit["status"], "COVERED")

    def test_unresolvable_is_recorded_not_dropped(self):
        cls = core.classify("意味不明の断片")
        self.assertEqual(cls["kind"], core.UNRESOLVED)
        self.assertTrue(cls["unhandled_conditions"])


class DependencyTests(unittest.TestCase):
    def test_name_article_and_enforced_version(self):
        deps = core.parse_dependencies("所得税法第八十九条の規定による", {"所得税法": "340AC0000000033"})
        self.assertTrue(any(d.get("type") == "law_article" and d.get("law_name") == "所得税法"
                            for d in deps))

    def test_bare_15_digit_is_only_a_hint(self):
        deps = core.parse_dependencies("340AC0000000033", {"340AC0000000033": "x"})
        hints = [d for d in deps if d.get("type") == "law_id"]
        self.assertTrue(hints)
        self.assertTrue(all(d.get("sufficient") is False for d in hints))


def _unit(uid="u", status=None, deps=None, blockers=None, unhandled=None, evidence=None):
    u = {
        "id": uid, "law_id": "L", "article": "A1", "enforcement_date": "2026-04-01",
        "status": status or core.STATUS_NOT_STARTED, "dependencies": deps or [],
        "blockers": blockers or [], "unhandled_conditions": unhandled or [],
        "evidence": evidence or {}, "owner": "",
    }
    return u


def _full_evidence(ref="sha256:abc"):
    return {k: ref for k in core.EVIDENCE_AXES}


class StatusTests(unittest.TestCase):
    def test_presence_facts_never_complete(self):
        u = _unit()
        st, _ = core.derive_status(u, _full_evidence())
        self.assertEqual(st, core.STATUS_FULLY_VERIFIED)

    def test_empty_evidence_ref_refused(self):
        empty = {k: "" for k in core.EVIDENCE_AXES}
        st, _ = core.derive_status(_unit(), empty)
        self.assertNotEqual(st, core.STATUS_FULLY_VERIFIED)

    def test_full_evidence_yields_fully_verified(self):
        st, errs = core.derive_status(_unit(), _full_evidence())
        self.assertEqual(st, core.STATUS_FULLY_VERIFIED)
        self.assertEqual(errs, [])

    def test_blocker_wins(self):
        u = _unit(blockers=[{"reason": "x", "resolved": False}], evidence=_full_evidence())
        self.assertEqual(core.derive_status(u, _full_evidence())[0], core.STATUS_BLOCKED)

    def test_unresolved_caps_at_proved_scope(self):
        u = _unit(unhandled=["unmodelled condition"])
        self.assertEqual(core.derive_status(u, _full_evidence())[0], core.STATUS_PROVED_SCOPE)

    def test_merge_preserves_owner_and_downgrades_on_source_change(self):
        state = {"schema": "task_state/v1", "units": {"u": {
            "unit_id": "u", "owner": "ALICE", "status": core.STATUS_FULLY_VERIFIED,
            "source_digest": "old", "evidence": _full_evidence(), "blockers": [],
        }}}
        state, _ = core.merge_state(state, [{"id": "u", "source_digest": "new"}])
        self.assertEqual(state["units"]["u"]["owner"], "ALICE")
        self.assertEqual(state["units"]["u"]["status"], core.STATUS_NOT_STARTED)


class SelectorTests(unittest.TestCase):
    def test_bare_id_dependency_does_not_satisfy_readiness(self):
        tasks = [
            _unit("a", deps=[{"type": "law_id", "law_id": "L2",
                              "resolution": "unresolved_underdetermined", "sufficient": False}]),
            _unit("b", deps=[]),
        ]
        report = task_selector.select_tasks(tasks, 10)
        ids = [s["normative_id"] for s in report["selected"]]
        self.assertNotIn("a", ids)  # referencing unit must not be selectable

    def test_ready_unit_is_selected_and_claimed_is_skipped(self):
        tasks = [_unit("a"), _unit("b")]
        report = task_selector.select_tasks(tasks, 10, {"a": "ALICE"})
        ids = [s["normative_id"] for s in report["selected"]]
        self.assertEqual(ids, ["b"])


if __name__ == "__main__":
    unittest.main()
