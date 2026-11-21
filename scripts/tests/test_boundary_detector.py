#!/usr/bin/env python3
"""Tests for genuine boundary-evidence detection (Objective §3)."""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"
spec = importlib.util.spec_from_file_location("ve_bound", CI / "generate_verification_evidence.py")
ve = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ve)


class BoundaryDetectorTests(unittest.TestCase):
    def test_zero_small_and_saturation_are_distinct_categories(self):
        text = """
        example : f 0 5 = 5 := by decide
        example : f 12 5 = 12 := by decide
        example : g 9 9 = 0 := by decide
        """
        cats = ve.boundary_evidence_categories(text)
        self.assertEqual(cats, {"zero", "small_input", "saturation"})

    def test_incidental_large_digits_do_not_count(self):
        text = """
        example : f 1_000_000 850_000 = 150_000 := by decide
        example : f 800_000 900_000 = 0 := by decide
        """
        cats = ve.boundary_evidence_categories(text)
        self.assertNotIn("small_input", cats)
        self.assertIn("saturation", cats)

    def test_rfl_proofs_are_recognised(self):
        text = "example : lowRateNum 0 = 0 := by rfl\n"
        cats = ve.boundary_evidence_categories(text)
        self.assertEqual(cats, {"zero", "saturation"})

    def test_examples_without_kernel_proof_are_ignored(self):
        text = "example : f 0 = 0 := by\n  omega\n"
        self.assertEqual(ve.boundary_evidence_categories(text), set())

    def test_statutory_threshold_boundary_is_recognised(self):
        # A Bool-valued 60-hour threshold (法人税法施行規則 art. 7): the kernel
        # decides 59 (below), 60 (at) and 61 (above) the statutory literal.
        text = """
        example : meetsAnnualHours 0 = false := by decide
        example : meetsAnnualHours 59 = false := by decide
        example : meetsAnnualHours 60 = true := by decide
        example : meetsAnnualHours 61 = true := by decide
        """
        cats = ve.boundary_evidence_categories(text, [60])
        self.assertEqual(
            cats,
            {"zero", "threshold_below", "threshold_at", "threshold_above"},
        )

    def test_threshold_categories_require_adjacent_to_a_spec_literal(self):
        text = """
        example : f 9 = false := by decide
        example : f 10 = true := by decide
        example : f 11 = true := by decide
        """
        # Without a matching literal, 9/10/11 are not statutory boundaries.
        self.assertNotIn("threshold_at", ve.boundary_evidence_categories(text, [60]))
        # With literal 10 they are genuine boundaries.
        self.assertEqual(
            ve.boundary_evidence_categories(text, [10]),
            {"small_input", "threshold_below", "threshold_at", "threshold_above"},
        )


if __name__ == "__main__":
    unittest.main(verbosity=2)
