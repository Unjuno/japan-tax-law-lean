#!/usr/bin/env python3
"""Regression tests for attestation-backed verification evidence."""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"


def load():
    spec = importlib.util.spec_from_file_location("ve_mod", CI / "generate_verification_evidence.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


ve = load()


class NumeralTests(unittest.TestCase):
    def test_kanji_conversion(self):
        self.assertEqual(ve.int_to_kanji(12), "十二")
        self.assertEqual(ve.int_to_kanji(2_900_000), "二百九十万")
        self.assertEqual(ve.int_to_kanji(0), "零")
        self.assertEqual(ve.int_to_kanji(2026), "二千二十六")

    def test_spec_literals_exclude_examples(self):
        text = """
        def specFull : Nat := 2_900_000
        def specMonthly (m : Nat) : Nat := m * 2_900_000 / 12
        example : specMonthly 1 = 241_666 := by decide
        def agreeX : Bool := specFull == 99
        """
        self.assertEqual(ve.spec_literals(text), {2_900_000, 12})

    def test_independent_spec_rejects_circular_definition(self):
        impl = "def full : Nat := 2_900_000\n"
        good = "def specFull : Nat := 2_900_000\ndef agreeX := specFull == full\n"
        bad = "def specFull : Nat := full\n"
        self.assertTrue(ve.independent_spec_ok(good, impl))
        self.assertFalse(ve.independent_spec_ok(bad, impl))

    def test_article_key_from_check_name(self):
        self.assertEqual(ve.article_from_name("地方税法 art. 72の49の14 ↔ X.lean"), "72_49_14")
        self.assertEqual(ve.article_from_name("相続税法 art. 21-5 ↔ Y.lean"), "21_5")


class AttestationTests(unittest.TestCase):
    def test_missing_module_hash_is_rejected(self):
        att = {
            "jobs": {"Build Lean project and check axioms": {"conclusion": "success"}},
            "modules": {},
        }
        self.assertFalse(ve.kernel_attested(att, "NoSuchModule"))

    def test_failed_ci_job_is_rejected(self):
        att = {
            "jobs": {"Build Lean project and check axioms": {"conclusion": "failure"}},
            "modules": {},
        }
        self.assertFalse(ve.kernel_attested(att, "BusinessOwnerDeduction"))

    def test_live_attestation_verifies_business_owner_deduction(self):
        att = ve.load_attestation()
        self.assertTrue(ve.kernel_attested(att, "BusinessOwnerDeduction"))


class LedgerTests(unittest.TestCase):
    def test_all_evidence_references_are_nonempty_and_traceable(self):
        import json
        ledger = json.loads((CI.parents[1] / "data" / "verification_evidence.json").read_text(encoding="utf-8"))
        self.assertTrue(ledger["units"])
        axes = set(next(iter(ledger["units"].values())).keys())
        for uid, ev in ledger["units"].items():
            self.assertTrue(uid.startswith("NORM|"))
            for axis in axes:
                self.assertIsInstance(ev.get(axis), str)
                self.assertGreater(len(ev[axis]), 10, (uid, axis))


if __name__ == "__main__":
    unittest.main(verbosity=2)
