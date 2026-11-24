"""Directive §2 axis-ledger tests.

The headline status must not hide the eight separate obligations, and human
legal review must never be inferred from technical evidence.
"""
import importlib.util
import pathlib
import unittest

REPO = pathlib.Path(__file__).resolve().parents[2]


def load(name: str, rel: str):
    spec = importlib.util.spec_from_file_location(name, REPO / rel)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


class DirectiveAxisTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.mod = load("directive_axes_test", "scripts/ci/directive_axes.py")

    def test_eight_axes_exist_in_directive_order(self):
        self.assertEqual(self.mod.AXES, (
            "SOURCE_ACQUIRED", "VERSION_PINNED", "STRUCTURE_IDENTIFIED",
            "NORM_DECOMPOSED", "NORMS_FORMALIZED", "SPEC_IMPL_CORRESPONDENCE",
            "BOUNDARY_CHECKED", "SOURCE_AUDITED",
        ))

    def test_no_evidence_yields_all_not_started(self):
        axes = self.mod.axis_states("NORM|x", {}, None, {})
        self.assertEqual(axes, self.mod.DEFAULTS)

    def test_placeholder_is_not_evidence(self):
        ev = {"independent_spec": "__SPEC__", "implementation": "__IMPL__",
              "kernel_proof": "__PROOF__"}
        axes = self.mod.axis_states("NORM|x", ev, None, {})
        self.assertEqual(axes["NORMS_FORMALIZED"], "NOT_STARTED")
        self.assertEqual(axes["SPEC_IMPL_CORRESPONDENCE"], "NOT_STARTED")

    def test_full_technical_evidence_advances_eight_axes_but_not_review(self):
        ev = {
            "source_location": ("data/raw/340AC0000000034_20260101.law.json#LawBody/Main"
                                "/Article:12/Paragraph#1 sha256=abc"),
            "cross_law_proof": "unit dependencies=0; enforced revision=340AC..._20260101",
            "decomposition_audit": "exact reconstruction, coverage=COVERED",
            "independent_spec": "JapanTaxLaw/FooSpec.lean sha256=bbb (spec* definitions)",
            "implementation": "JapanTaxLaw/Foo.lean sha256=ccc",
            "kernel_proof": "CI run success, 3 module hashes re-verified",
            "proof_scope": "spec numerals in clause; constants [3] kernel-checked",
            "boundary_proof": "attested Tests module kernel-decided examples",
            "source_correspondence_audit": "scoped article numerals verified",
            "adversarial_review": "module-specific independent re-extraction H/T/D/C/U",
        }
        task = {"article": "12", "paragraph": "1", "kind": "CONDITION", "scope": "FULL_ARTICLE"}
        axes = self.mod.axis_states("NORM|x", ev, task, {})
        self.assertTrue(all(a != "NOT_STARTED" for a in axes.values()), axes)
        # The human axis is not part of the eight technical axes at all.
        self.assertNotIn("HUMAN_LEGAL_REVIEW", axes)

    def test_norm_details_are_recorded_by_category(self):
        details = self.mod.norm_details({
            "text": "ただし、百万円を超える場合には、千円未満の端数を切り捨て、令和8年4月1日から適用する。"
        })
        self.assertTrue(details["exceptions"])
        self.assertTrue(details["conditions"])
        self.assertTrue(details["amounts"])
        self.assertTrue(details["rounding"])
        self.assertTrue(details["enforcement_dates"])

    def test_committed_ledger_keeps_review_pending_and_scope_distinct(self):
        data = self.mod.build()
        self.assertEqual(len(data["axes"]), 8)
        self.assertEqual(list(data["norm_detail_categories"]),
                         list(self.mod.NORM_DETAIL_KEYS))
        self.assertTrue(data["human_review_is_never_auto_satisfied"])
        self.assertIn(self.mod.HUMAN_REVIEW_DEFAULT, data["legal_review_counts"])
        self.assertIn("FULL_ARTICLE", data["scope_counts"])
        self.assertIn("COMPUTABLE_SLICE_ONLY", data["scope_counts"])
        for record in data["detail_units"].values():
            self.assertEqual(len(record["axes"]), 8)
            self.assertIn(record["scope_kind"], self.mod.SCOPE_VALUES)
            # A genuine recorded human decision is valid vocabulary; the point
            # is that technical evidence can never manufacture one.
            self.assertTrue(record["human_legal_review"])
            self.assertIn(record["human_legal_review"], (
                self.mod.HUMAN_REVIEW_DEFAULT, "LEGAL_REVIEW_APPROVED",
                "LEGAL_REVIEW_REJECTED"))

    def test_a_pinned_paragraph_is_never_claimed_as_whole_article(self):
        self.assertEqual(self.mod.scope_kind_for(
            {"scope": "FULL_ARTICLE", "article": "12"}), "FULL_ARTICLE")
        self.assertEqual(self.mod.scope_kind_for(
            {"scope": "FULL_ARTICLE", "article": "12", "paragraph": "1"}),
            "COMPUTABLE_SLICE_ONLY")
        self.assertEqual(self.mod.scope_kind_for(
            {"scope": "FULL_ARTICLE", "article": "12", "item": "1"}),
            "COMPUTABLE_SLICE_ONLY")

    def test_failure_states_are_not_counted_as_achieved(self):
        self.assertNotEqual(self.mod.ACHIEVED["SOURCE_ACQUIRED"], "PIN_FILE_MISSING")
        self.assertNotEqual(self.mod.ACHIEVED["BOUNDARY_CHECKED"],
                            "UNHANDLED_CONDITIONS")


if __name__ == "__main__":
    unittest.main()
