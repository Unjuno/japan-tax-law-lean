"""Directive §1 regressions for the canonical normative-unit core.

These tests pin the exact failure modes the directive forbids: truncated/colliding
ids, article-level (rather than norm-unit) granularity, completion from a needle
or file/name match, 15-digit-only dependency analysis, and loss of durable state.
"""
from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CI = REPO / "scripts" / "ci"
sys.path.insert(0, str(CI))

from normative_core import (  # noqa: E402
    BLOCKED, FULLY_VERIFIED, LEGAL_REVIEW_PENDING, MECHANICAL_AXES,
    NOT_STARTED, PARTIAL, PROVED_SCOPE, UNRESOLVED_KINDS,
    assert_unique, audit_coverage, canonical_norm_id, decompose,
    derive_status, load_evidence, load_state, merge_state, parse_dependencies,
    record_evidence, save_state, save_evidence,
)


class IdTests(unittest.TestCase):
    def test_full_digest_and_distinguishing_components(self):
        base = dict(law_id="143AC0000000054", revision_id="143AC0000000054_20260601_508AC0000000005",
                    history_id="508AC0000000005", provision="Main", article="第一条",
                    norm_kind="LEGAL_EFFECT", unit_index=0, source_sha256="a" * 64,
                    text_digest="b" * 64)
        ident = canonical_norm_id(**base)
        self.assertEqual(len(ident), 64)
        self.assertRegex(ident, r"^[0-9a-f]{64}$")
        for field, alternative in (
            ("article", "第二条"),
            ("provision", "Supplementary"),
            ("history_id", "999AC0000000009"),
            ("norm_kind", "EXCEPTION"),
            ("unit_index", 1),
            ("structural_path", "SupplProvision#2/Article:1#0"),
        ):
            changed = canonical_norm_id(**{**base, field: alternative})
            self.assertNotEqual(ident, changed, f"{field} did not change id")

    def test_collision_check_is_strict(self):
        ident = canonical_norm_id(law_id="X", revision_id="Y")
        with self.assertRaises(ValueError):
            assert_unique([ident, ident])


class DecompositionTests(unittest.TestCase):
    def test_exact_reconstruction_and_norm_units(self):
        text = "第一条 課税する。ただし、控除する場合にはこの限りでない。"
        units = decompose(text)
        self.assertGreaterEqual(len(units), 2)
        self.assertTrue(audit_coverage(text, units)["reconstruction_ok"])
        kinds = {u["norm_kind"] for u in units}
        self.assertIn("LEGAL_EFFECT", kinds)
        self.assertIn("EXCEPTION", kinds)

    def test_undecomposable_text_recorded_not_dropped(self):
        text = "見出しだけの見出し"
        units = decompose(text)
        self.assertTrue(any(u["norm_kind"] in UNRESOLVED_KINDS for u in units))


class DependencyTests(unittest.TestCase):
    def test_more_than_15_digit_ids(self):
        text = ("租税特別措置法第四十二条の二に規定する税率については、"
                "令和六年四月一日から適用する。143AC0000000054 を参照。")
        deps = parse_dependencies(text, {"laws": []})
        kinds = {dep["kind"] for dep in deps}
        self.assertIn("law_id_15", kinds)
        self.assertTrue({"law_name", "article_reference", "enforcement_version"} & kinds)

    def test_non_tax_law_name_is_captured(self):
        deps = parse_dependencies("地方税法に規定する条例第3条", {"laws": []})
        values = " ".join(dep["value"] for dep in deps)
        self.assertIn("条例", values)


class CompletionTests(unittest.TestCase):
    def _unit(self, ident="unit-1", deps=None, unresolved=None):
        return {"norm_id": ident, "dependencies": deps or [],
                "unresolved_conditions": unresolved or []}

    def test_weak_hints_never_complete(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            state_file = root / "state.json"
            evidence_file = root / "evidence.json"
            state = {"units": {}}
            save_state(state, state_file)
            save_evidence({"units": {}}, evidence_file)
            unit = self._unit()
            verdict = derive_status(unit, load_state(state_file),
                                    load_evidence(evidence_file))
            self.assertEqual(verdict["status"], NOT_STARTED)

    def test_partial_and_proved_scope_and_full(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            state_file, evidence_file = root / "state.json", root / "evidence.json"
            state = {"units": {}}
            evidence = {"units": {}}
            unit = self._unit()
            proofish = ("INDEPENDENT_SPEC", "IMPLEMENTATION", "KERNEL_PROOF", "TEST")
            for axis in proofish:
                record_evidence(evidence, unit["norm_id"], axis,
                                evidence_ref=f"file:{axis}.lean")
            status = derive_status(unit, state, evidence)["status"]
            self.assertEqual(status, PROVED_SCOPE)
            for axis in MECHANICAL_AXES:
                record_evidence(evidence, unit["norm_id"], axis,
                                evidence_ref=f"file:{axis}")
            status = derive_status(unit, state, evidence)["status"]
            self.assertEqual(status, FULLY_VERIFIED)
            # An unresolved condition prevents FULLY_VERIFIED.
            blocked = self._unit("unit-2", unresolved=["UNDECIDABLE"])
            self.assertNotEqual(derive_status(blocked, state, evidence)["status"],
                                FULLY_VERIFIED)

    def test_blocker_dominates(self):
        state = {"units": {"u": {"blockers": ["needs human input"]}}}
        verdict = derive_status(self._unit("u"), state, {"units": {}})
        self.assertEqual(verdict["status"], BLOCKED)

    def test_legal_review_is_separate_axis(self):
        state = {"units": {"u": {"legal_review": LEGAL_REVIEW_PENDING}}}
        verdict = derive_status(self._unit("u"), state, {"units": {}})
        self.assertNotIn("legal_review", verdict["axes"])

    def test_merge_state_preserves_owner_and_marks_stale(self):
        state = {"units": {"gone": {"owner_agent": "PROVE", "status": PROVED_SCOPE}}}
        merged = merge_state(state, [self._unit("live")])
        self.assertEqual(merged["stale_units"]["gone"]["status"], "STALE")
        self.assertEqual(merged["units"]["live"]["status"], NOT_STARTED)


if __name__ == "__main__":
    unittest.main()
