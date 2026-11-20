"""Regression tests for honest scope/evidence attestation fixes (§1.5, §3, §5)."""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]


def load(name: str, rel: str):
    spec = importlib.util.spec_from_file_location(name, REPO / rel)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


SSM = load("ssm_under_test", "scripts/ci/spec_scope_map.py")
VE = load("ve_under_test", "scripts/ci/generate_verification_evidence.py")


class MultiBranchArticleTests(unittest.TestCase):
    def test_article_key_keeps_all_branches(self):
        self.assertEqual(SSM.article_key("72の49の14"), "72_49_14")
        self.assertEqual(SSM.article_key("21-7"), "21_7")
        self.assertEqual(SSM.article_key("第三十一条の四"), SSM.core.article_key("第三十一条の四"))

    def test_declared_scope_parses_multiple_branches(self):
        src = "/-!\nSource: 地方税法 art. 72の49の14 and 第21条の3の2\n-/"
        scope = SSM.declared_scope(src)
        self.assertIn("72_49_14", scope["articles"])
        self.assertIn("21_3_2", scope["articles"])


class EvidenceReviewTests(unittest.TestCase):
    def test_review_in_independent_doc_is_accepted(self):
        adv = (REPO / "docs/ADVERSARIAL_REVIEW.md").read_text(encoding="utf-8")
        self.assertTrue(
            VE.review_ok("DeemedCapitalGainsCost", adv),
            "a module-specific review in INDEPENDENT_SOURCE_REVIEW.md must count",
        )

    def test_unreviewed_module_is_not_accepted(self):
        adv = (REPO / "docs/ADVERSARIAL_REVIEW.md").read_text(encoding="utf-8")
        self.assertFalse(VE.review_ok("NoSuchModuleEver", adv))

    def test_checks_by_module_uses_canonical_article_keys(self):
        mods = VE.checks_by_module()
        info = mods.get("DeemedCapitalGainsCost")
        self.assertIsNotNone(info)
        self.assertEqual(info["article"], "31_4")

    def test_attested_count_increased(self):
        d = VE.build()
        self.assertGreaterEqual(len(d["units"]), 9)


if __name__ == "__main__":
    unittest.main()
