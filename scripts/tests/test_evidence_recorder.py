#!/usr/bin/env python3
"""Tests for recording real verification evidence (Objective §3/§5)."""
from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))
sys.path.insert(0, str(REPO / "scripts"))

import evidence_recorder as er  # noqa: E402
import normative_core as core  # noqa: E402


class TestArticleKey(unittest.TestCase):
    def test_kanji_articles(self):
        self.assertEqual(er.article_key("第六十六条"), "66")
        self.assertEqual(er.article_key("第二十一条の七"), "21_7")
        self.assertEqual(er.article_key("第九条の三の二"), "9_3_2")
        self.assertEqual(er.article_key(None), "")


class TestAttestation(unittest.TestCase):
    def test_forbidden_axioms_are_extracted(self):
        text = "\n".join([
            "'A.x' does not depend on any axioms",
            "'A.y' depends on axioms: [propext]",
            "'A.z' depends on axioms: [propext, sorryAx]",
        ])
        result = er_module_parse(text)
        self.assertEqual(result["A.x"], [])
        self.assertEqual(result["A.y"], ["propext"])
        self.assertEqual(result["A.z"], ["propext", "sorryAx"])


def er_module_parse(text: str):
    """Local re-implementation of the public parser via a temp log file."""
    with tempfile.TemporaryDirectory() as d:
        p = Path(d) / "log.txt"
        p.write_text(text, encoding="utf-8")
        return parse_via_module(p)


def parse_via_module(path: Path):
    # build_kernel_attestation.parse_log is the single source of truth
    import build_kernel_attestation as bka
    return bka.parse_log(path.read_text(encoding="utf-8"))


class TestModuleFacts(unittest.TestCase):
    def test_real_chain_has_kernel_decided_correspondence(self):
        att = {"forbidden_axiom_hits": {}, "ci_run_id": "1", "commit": "abc"}
        facts = er.module_facts("CorporateTaxRate", att, "CorporateTaxRate.lean")
        self.assertTrue(facts["ok"], facts)
        self.assertTrue(facts["agree"])
        self.assertTrue(facts["review"])

    def test_missing_chain_is_refused(self):
        att = {"forbidden_axiom_hits": {}, "ci_run_id": "1", "commit": "abc"}
        facts = er.module_facts("NoSuchModuleXYZ", att, "")
        self.assertFalse(facts["ok"])

    def test_forbidden_axiom_attestation_is_refused(self):
        att = {"forbidden_axiom_hits": {"A.x": ["sorryAx"]}, "ci_run_id": "1", "commit": "abc"}
        facts = er.module_facts("CorporateTaxRate", att, "")
        self.assertFalse(facts["ok"])


class TestEvidenceDerivation(unittest.TestCase):
    def test_no_cross_law_dependency_needs_no_cross_law_proof(self):
        unit = {"dependencies": [], "unhandled_conditions": [], "blockers": [],
                "status": "NOT_STARTED"}
        ev = {k: "ref" for k in core.EVIDENCE_AXES}
        ev["cross_law_proof"] = ""
        status, _ = core.derive_status(unit, ev)
        self.assertEqual(status, "FULLY_VERIFIED")
        unit["dependencies"] = [{"law_id": "340AC0000000034", "article": "2", "sufficient": True}]
        status, _ = core.derive_status(unit, ev)
        self.assertEqual(status, "PROVED_SCOPE")

    def test_legal_review_is_not_an_evidence_axis(self):
        self.assertNotIn("legal_review", core.EVIDENCE_AXES)


if __name__ == "__main__":
    unittest.main(verbosity=2)
