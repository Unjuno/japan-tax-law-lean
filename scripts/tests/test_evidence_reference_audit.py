"""Regression tests for evidence-reference resolution (Objective §4/§5)."""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"


def load():
    spec = importlib.util.spec_from_file_location("evidence_ref_audit", CI / "audit_evidence_references.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


mod = load()


class ReferenceResolutionTests(unittest.TestCase):
    REVIEW = "## Batch P review\n\nreviews `JapanTaxLaw/SomeModule.lean` only.\n\n## Batch Q review\n\nx\n"

    def test_module_present_in_batch_section_passes(self):
        axes = {
            "adversarial_review": "docs/ADVERSARIAL_REVIEW.md Batch P: re-extraction",
            "implementation": "JapanTaxLaw/SomeModule.lean",
        }
        fs = mod.check_unit("u1", axes, self.REVIEW, {})
        ad = next(f for f in fs if f["axis"] == "adversarial_review")
        self.assertEqual(ad["D"], "PASS")

    def test_module_absent_from_cited_section_fails(self):
        axes = {
            "adversarial_review": "docs/ADVERSARIAL_REVIEW.md Batch P: re-extraction",
            "implementation": "JapanTaxLaw/OtherModule.lean",
        }
        fs = mod.check_unit("u2", axes, self.REVIEW, {})
        ad = next(f for f in fs if f["axis"] == "adversarial_review")
        self.assertEqual(ad["D"], "FAIL")
        self.assertIn("OtherModule", ad["detail"])

    def test_missing_batch_section_fails(self):
        axes = {
            "adversarial_review": "docs/ADVERSARIAL_REVIEW.md Batch Z: re-extraction",
            "implementation": "JapanTaxLaw/SomeModule.lean",
        }
        fs = mod.check_unit("u3", axes, self.REVIEW, {})
        ad = next(f for f in fs if f["axis"] == "adversarial_review")
        self.assertEqual(ad["D"], "FAIL")

    def test_findings_carry_ht_dcu(self):
        axes = {"adversarial_review": "docs/ADVERSARIAL_REVIEW.md Batch P"}
        fs = mod.check_unit("u4", axes, self.REVIEW, {})
        for f in fs:
            for key in ("H", "T", "D", "C", "U"):
                self.assertTrue(f[key])


if __name__ == "__main__":
    unittest.main()
