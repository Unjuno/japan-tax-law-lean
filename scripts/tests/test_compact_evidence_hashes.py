"""Tests for the hash-prefix evidence compaction migration."""
from __future__ import annotations

import unittest

from scripts.ci.compact_evidence_hashes import compact_value, SHA64, NAMESPACE


class TestEvidenceHashCompaction(unittest.TestCase):
    def test_full_hash_shortened(self):
        h = "a" * 64
        out = compact_value(f"JapanTaxLaw/X.lean sha256={h}")
        self.assertIn("sha256=" + "a" * 16, out)
        self.assertNotIn(h, out)

    def test_bulk_namespace_compacted(self):
        out = compact_value("JapanTaxLaw/BulkCondABC.lean namespace JapanTaxLaw.BulkCondABC.x123")
        self.assertIn("batch=BulkCondABC ns=x123", out)
        self.assertNotIn("namespace JapanTaxLaw", out)

    def test_regexes(self):
        self.assertTrue(SHA64.search("sha256=" + "0" * 64))
        self.assertTrue(NAMESPACE.search("namespace JapanTaxLaw.BulkCond1.xabc"))


if __name__ == "__main__":
    unittest.main()
