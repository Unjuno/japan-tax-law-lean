#!/usr/bin/env python3
"""Unit tests for the norm identity / decomposition primitives.

These tests are pure: they need no repository data and can run anywhere.
Run: python -m unittest scripts.tests.test_norm_identity -v
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "ci"))

import norm_identity as ni  # noqa: E402


class NormIdTests(unittest.TestCase):
    def base(self, **kw):
        args = dict(
            law_id="340AC0000000033",
            revision_id="340AC0000000033_20260601_508AC0000000005",
            provision_kind="Main",
            article_no="89",
            paragraph_no="1",
            item_no="",
            subitem_no="",
            table_cell="",
            unit_index=0,
            kind=ni.EFFECT,
            text="税率は百分の十とする",
        )
        args.update(kw)
        return ni.make_norm_id(**args)

    def test_id_changes_with_every_locality_discriminator(self):
        base = self.base()
        variants = [
            self.base(law_id="340AC0000000034"),
            self.base(revision_id="other_revision"),
            self.base(provision_kind="Supplementary"),
            self.base(article_no="90"),
            self.base(paragraph_no="2"),
            self.base(item_no="1"),
            self.base(subitem_no="イ"),
            self.base(table_cell="別表第一/1"),
            self.base(unit_index=1),
            self.base(kind=ni.CONDITION),
            self.base(text="税率は百分の二十とする"),
        ]
        self.assertEqual(len(set([base] + variants)), len(variants) + 1)

    def test_id_is_deterministic(self):
        self.assertEqual(self.base(), self.base())

    def test_id_length(self):
        self.assertEqual(len(self.base()), 24)


class DecompositionTests(unittest.TestCase):
    def text(self):
        return (
            "第一条税率は百分の十とする。"
            "ただし、政令で定める場合は、この限りではない。"
            "第二十条の規定を準用する。"
            "みなし、推定し、読み替える。"
        )

    def units(self):
        return ni.decompose(
            self.text(),
            law_id="340AC0000000033",
            revision_id="rev",
            provision_kind="Main",
            article_no="1",
        )

    def test_partition_covers_original(self):
        result = ni.verify_coverage(self.text(), self.units())
        self.assertTrue(result["covered"], result["problems"])
        self.assertEqual(result["unit_count"], len(self.units()))

    def test_exception_and_reference_detected(self):
        units = self.units()
        kinds = [u["kind"] for u in units]
        all_kinds = set(kinds)
        for u in units:
            all_kinds.update(u["secondary_kinds"])
        self.assertIn(ni.EFFECT, kinds)
        self.assertIn(ni.EXCEPTION, kinds)
        self.assertIn(ni.REFERENCE, all_kinds)
        self.assertIn(ni.DEEMING, all_kinds)
        self.assertIn(ni.READING_SUBSTITUTION, all_kinds)

    def test_unique_ids(self):
        ids = [u["norm_id"] for u in self.units()]
        self.assertEqual(len(set(ids)), len(ids))

    def test_offsets_match_text(self):
        t = ni.norm(self.text())
        for u in self.units():
            self.assertEqual(u["text"], t[u["char_start"]:u["char_end"]])

    def test_unresolvable_text_is_recorded_not_dropped(self):
        units = ni.decompose(
            "意味不明な文言。",
            law_id="X", revision_id="R", provision_kind="Main", article_no="1",
        )
        self.assertTrue(units)
        self.assertEqual(units[0]["kind"], ni.UNRESOLVED)
        self.assertTrue(ni.verify_coverage("意味不明な文言。", units)["covered"])

    def test_coverage_detects_tampering(self):
        units = [dict(u) for u in self.units()]
        units[1]["char_start"] += 1
        result = ni.verify_coverage(self.text(), units)
        self.assertFalse(result["covered"])
        self.assertTrue(any("gap/overlap" in p for p in result["problems"]))

    def test_coverage_detects_dropped_unit(self):
        units = self.units()[1:]
        result = ni.verify_coverage(self.text(), units)
        self.assertFalse(result["covered"])

    def test_whitespace_normalisation(self):
        self.assertEqual(ni.norm("  a　b \tc"), "abc")


class DependencyTests(unittest.TestCase):
    def test_multiple_resolution_channels(self):
        text = (
            "関税定率法第六条及び所得税法第八十九条の規定を準用する。"
            "令和八年法律第五号(123456789012345)は令和八年六月一日から施行する。"
        )
        deps = ni.extract_dependencies(
            text, {"関税定率法": "143AC0000000054", "所得税法": "340AC0000000033"}
        )
        self.assertEqual(deps["law_titles"], ["所得税法", "関税定率法"])
        self.assertIn("340AC0000000033", deps["law_id_bound_by_title"])
        self.assertIn("第六条", deps["article_numbers"])
        self.assertIn("第八十九条", deps["article_numbers"])
        self.assertIn("123456789012345", deps["law_id_15digit"])
        self.assertIn("version", deps["resolution_channels"])
        self.assertIn("title", deps["resolution_channels"])
        self.assertIn("article", deps["resolution_channels"])

    def test_raw_digits_are_not_the_only_channel(self):
        deps = ni.extract_dependencies("所得税法第八条による", {"所得税法": "340AC0000000033"})
        self.assertEqual(deps["law_id_15digit"], [])
        self.assertIn("340AC0000000033", deps["law_id_bound_by_title"])


class StateTests(unittest.TestCase):
    def make_units(self):
        return ni.decompose(
            "第一条税率は百分の十とする。",
            law_id="L", revision_id="R", provision_kind="Main", article_no="1",
        )

    def test_state_survives_regeneration(self):
        units = self.make_units()
        unit = units[0]
        unit["status"] = ni.PROVED_SCOPE
        unit["owner"] = "PROVE"
        unit["evidence"] = {k: ni.evidence(ni.SATISFIED) for k in ni.TECHNICAL_OBLIGATIONS}
        state = ni.default_state()
        state = ni.overlay_from_units(units, state)

        fresh = self.make_units()
        ni.apply_overlay(fresh, state)
        self.assertEqual(fresh[0]["status"], ni.PROVED_SCOPE)
        self.assertEqual(fresh[0]["owner"], "PROVE")
        self.assertEqual(len(fresh[0]["evidence"]), len(ni.TECHNICAL_OBLIGATIONS))

    def test_source_change_quarantines_old_state(self):
        units = self.make_units()
        units[0]["status"] = ni.FULLY_VERIFIED
        state = ni.overlay_from_units(units, ni.default_state())
        # Same norm id (same text) but the pinned source fragment changed —
        # e.g. a different locator/encoding in the raw snapshot.
        changed = self.make_units()
        changed[0]["source_sha256"] = "sha256-of-a-different-source-fragment"
        ni.apply_overlay(changed, state)
        self.assertEqual(changed[0]["status"], ni.NOT_STARTED)
        self.assertEqual(changed[0]["blocker"], "SOURCE_FRAGMENT_CHANGED")


class StatusTests(unittest.TestCase):
    def test_technical_only_is_proved_scope_not_fully_verified(self):
        unit = {"evidence": {k: ni.evidence(ni.SATISFIED) for k in ni.TECHNICAL_OBLIGATIONS}}
        self.assertEqual(ni.derive_status(unit), ni.PROVED_SCOPE)
        unit["evidence"][ni.LEGAL_REVIEW_OBLIGATION] = ni.evidence(ni.SATISFIED)
        self.assertEqual(ni.derive_status(unit), ni.FULLY_VERIFIED)

    def test_string_match_alone_never_completes(self):
        unit = {"evidence": {
            "fidelity_pinned_needle": ni.evidence(ni.SATISFIED),
            "implementation_linked": ni.evidence(ni.SATISFIED,
                                                 reason="name string found"),
        }}
        self.assertEqual(ni.derive_status(unit), ni.PARTIAL)

    def test_blocker_wins(self):
        unit = {"blocker": "HUMAN_REVIEW_REQUIRED", "evidence": {
            k: ni.evidence(ni.SATISFIED) for k in ni.TECHNICAL_OBLIGATIONS
        }}
        self.assertEqual(ni.derive_status(unit), ni.BLOCKED)


if __name__ == "__main__":
    unittest.main(verbosity=2)
