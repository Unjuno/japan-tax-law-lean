"""Tests for the bulk-evidence compaction migration."""
from __future__ import annotations

import unittest

from scripts.ci.compact_bulk_evidence import AXES, compact


class TestEvidenceCompaction(unittest.TestCase):
    def test_bulk_entry_is_compacted(self):
        rec = {"implementation": "JapanTaxLaw/BulkStructLblABC.lean namespace X sha256=abc",
               "kernel_proof": "lake build X OK; batch axiom scan: long repeated text"}
        out = compact(rec)
        self.assertIn("BulkStructLblABC", out["kernel_proof"])
        self.assertNotIn("long repeated text", out["kernel_proof"])

    def test_non_bulk_entry_unchanged(self):
        rec = {"implementation": "JapanTaxLaw/Threshold.lean sha256=abc",
               "kernel_proof": "lake build OK"}
        self.assertEqual(compact(rec), rec)

    def test_axes_are_eleven(self):
        self.assertEqual(len(AXES), 11)


if __name__ == "__main__":
    unittest.main()
