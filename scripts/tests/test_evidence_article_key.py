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
    "ve_article_test", CI / "generate_verification_evidence.py"
)
ve = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ve)


class TestArticleKeyNormalisation(unittest.TestCase):
    def test_kanji_label_is_normalised(self):
        self.assertEqual(ve.core.article_key("第二十九条"), "29")
        self.assertEqual(ve.core.article_key("第四条の六"), "4_6")

    def test_checks_by_module_uses_canonical_key(self):
        modules = ve.checks_by_module()
        self.assertIn("ConsumptionTaxRate", modules)
        self.assertEqual(modules["ConsumptionTaxRate"]["article"], "29")
        self.assertIn("CorporateTaxRate", modules)
        self.assertEqual(modules["CorporateTaxRate"]["article"], "66")

    def test_scoped_article_text_is_nonempty_for_kanji_cited_check(self):
        mods = ve.checks_by_module()
        info = mods["ConsumptionTaxRate"]
        scoped = ve.scoped_article_text(info["law_id"], info["article"])
        self.assertTrue(scoped, "scoped source text must be found after normalisation")
        self.assertTrue(
            all(ve.core.norm(n) in scoped for n in info["needles"])
        )


if __name__ == "__main__":
    unittest.main()
