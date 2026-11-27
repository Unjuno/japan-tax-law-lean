"""Integrity test: every artifact path cited by verification evidence exists.

Evidence is authoritative for completion; a citation to a missing spec,
implementation, test, review note or pinned source is an integrity failure
even if the queue still reports the unit as FULLY_VERIFIED.
"""
from __future__ import annotations

import json
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]


class TestEvidenceArtifacts(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        import sys
        sys.path.insert(0, str(REPO))
        from scripts.ci.check_evidence_artifacts import cited_paths
        from scripts.ci.evidence_store import load_ledger
        cls.cited_paths = staticmethod(cited_paths)
        cls.evidence = load_ledger(REPO)

    def test_parser_finds_paths(self):
        paths = self.cited_paths("JapanTaxLaw/Foo.lean and docs/Bar.md and data/raw/X.law.json")
        self.assertEqual(paths, ["JapanTaxLaw/Foo.lean", "data/raw/X.law.json", "docs/Bar.md"])

    def test_no_stale_citation(self):
        stale = "docs/GIFT_21_5_VERIFICATION.md"
        hits = [(uid, axis) for uid, rec in self.evidence["units"].items()
                for axis, value in rec.items()
                if isinstance(value, str) and stale in value]
        self.assertEqual(hits, [])

    def test_every_cited_artifact_exists(self):
        missing = [(uid, p) for uid, rec in self.evidence["units"].items()
                   for axis, value in rec.items() if isinstance(value, str)
                   for p in self.cited_paths(value) if not (REPO / p).exists()]
        self.assertEqual(missing, [])


if __name__ == "__main__":
    unittest.main()
