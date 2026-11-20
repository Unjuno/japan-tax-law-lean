from __future__ import annotations

import importlib.util
import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CI = REPO / "scripts" / "ci"
if str(CI) not in sys.path:
    sys.path.insert(0, str(CI))

spec = importlib.util.spec_from_file_location(
    "ve_review_test", CI / "generate_verification_evidence.py"
)
ve = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ve)


class TestReviewMatcher(unittest.TestCase):
    def test_bare_module_mention_is_rejected(self):
        text = "# Review\n\nWe looked at JapanTaxLaw/Foo.lean and found it plausible.\n"
        self.assertFalse(ve.review_ok("Foo", text))

    def test_partial_conditions_are_rejected(self):
        text = (
            "## Batch Z review\n"
            "- 対象: `JapanTaxLaw/Foo.lean`\n"
            "- 一次資料 pinned 原文 から独立検算した。\n"
        )
        # independence + primary source present, but no re-extraction record
        self.assertFalse(ve.review_ok("Foo", text))

    def test_documented_equivalent_wording_is_accepted(self):
        text = (
            "## Batch S review\n"
            "### S-0. 範囲・手法\n"
            "- **対象モジュール**: `JapanTaxLaw/Foo.lean`\n"
            "- **一次資料**: pinned 原文 から直接抽出し、独立検算で比較した。\n"
            "## Batch T review\n"
        )
        self.assertTrue(ve.review_ok("Foo", text))

    def test_real_review_section_accepts_the_committed_module(self):
        path = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
        if not path.exists():
            self.skipTest("no adversarial review document on this branch")
        text = path.read_text(encoding="utf-8")
        self.assertTrue(ve.review_ok("ConsolidationCreditLimit", text))


if __name__ == "__main__":
    unittest.main()
