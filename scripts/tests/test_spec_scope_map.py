#!/usr/bin/env python3
"""Explicit spec-scope mapping must gate verification (Directive §1.5)."""
from __future__ import annotations

import importlib.util
import json
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CI = REPO / "scripts" / "ci"
spec = importlib.util.spec_from_file_location("ssm", CI / "spec_scope_map.py")
ssm = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ssm)


class ScopeMapTests(unittest.TestCase):
    def test_article_declarations_parsed(self):
        scope = ssm.declared_scope(
            "/-!\nSource: 340AC0000000033\n"
            "Independent restatement of art. 21-7 and 第89条 plus Art. 4-5.\n-/"
        )
        self.assertIn("21_7", scope["articles"])
        self.assertIn("89", scope["articles"])
        self.assertIn("4_5", scope["articles"])
        self.assertEqual(scope["law_ids"], ["340AC0000000033"])

    def test_unit_outside_declared_articles_rejected(self):
        scope = {"articles": ["21_7"], "law_ids": ["325AC0000000073"]}
        ok, reason = ssm.in_scope(
            {"law_id": "325AC0000000073", "article": "21_5",
             "unhandled_conditions": []}, scope)
        self.assertFalse(ok)
        self.assertIn("ARTICLE_NOT_DECLARED", reason)

    def test_unit_with_unresolved_conditions_rejected(self):
        scope = {"articles": ["21_7"], "law_ids": ["325AC0000000073"]}
        ok, reason = ssm.in_scope(
            {"law_id": "325AC0000000073", "article": "21_7",
             "unhandled_conditions": ["delegated_fact_unresolved"]}, scope)
        self.assertFalse(ok)
        self.assertEqual(reason, "UNIT_HAS_UNRESOLVED_CONDITIONS")

    def test_explicit_match_accepted(self):
        scope = {"articles": ["21_7"], "law_ids": ["325AC0000000073"]}
        ok, reason = ssm.in_scope(
            {"law_id": "325AC0000000073", "article": "21_7",
             "unhandled_conditions": []}, scope)
        self.assertTrue(ok)
        self.assertEqual(reason, "EXPLICIT_SCOPE_MATCH")

    def test_committed_map_exists_and_has_decisions(self):
        data = json.loads((REPO / "data" / "SPEC_SCOPE_MAP.json").read_text(encoding="utf-8"))
        self.assertGreater(len(data["modules"]), 0)
        self.assertGreater(sum(len(v) for v in data["decisions"].values()), 0)


if __name__ == "__main__":
    unittest.main(verbosity=2)
