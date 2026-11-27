"""Tests for sharded evidence-ledger load/append semantics."""
from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from scripts.ci import evidence_store as es


def record(axis: str = "kernel_proof") -> dict:
    return {"source_location": "data/raw/x.json#L1",
            "independent_spec": "JapanTaxLaw/XSpec.lean",
            "implementation": "JapanTaxLaw/X.lean",
            "kernel_proof": "lake build OK; " + axis,
            "tests": "JapanTaxLaw/XTests.lean",
            "proof_scope": "GATE ONLY",
            "boundary_proof": "exhaustive",
            "cross_law_proof": "none",
            "source_correspondence_audit": "verbatim",
            "decomposition_audit": "exact",
            "adversarial_review": "reviewed"}


class TestEvidenceStore(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        (self.root / "data").mkdir()
        (self.root / "data" / "verification_evidence.json").write_text(
            json.dumps({"note": "n", "schema": "s",
                        "units": {"NORM|" + "a" * 64: record()}},
                       ensure_ascii=False), encoding="utf-8")

    def tearDown(self):
        self.tmp.cleanup()

    def test_merge_main_and_shards(self):
        new = {"NORM|" + "b" * 64: record("shard")}
        es.append_shard(new, "batch1", repo=self.root)
        merged = es.load_ledger(self.root)
        self.assertEqual(merged["note"], "n")
        self.assertEqual(merged["schema"], "s")
        self.assertEqual(len(merged["units"]), 2)
        self.assertIn("NORM|" + "b" * 64, merged["units"])

    def test_collision_refused(self):
        with self.assertRaises(ValueError):
            es.append_shard({"NORM|" + "a" * 64: record()}, "bad", repo=self.root)
        self.assertFalse((self.root / "data" / "evidence_shards" / "bad.json").exists())

    def test_double_shard_collision_refused(self):
        uid = "NORM|" + "b" * 64
        es.append_shard({uid: record()}, "one", repo=self.root)
        with self.assertRaises(ValueError):
            es.append_shard({uid: record()}, "two", repo=self.root)

    def test_invalid_shard_name_refused(self):
        with self.assertRaises(ValueError):
            es.append_shard({"NORM|" + "b" * 64: record()}, "../escape", repo=self.root)

    def test_empty_shard_refused(self):
        with self.assertRaises(ValueError):
            es.append_shard({}, "empty", repo=self.root)

    def test_shard_is_compact_json(self):
        uid = "NORM|" + "b" * 64
        p = es.append_shard({uid: record("shard")}, "compactcheck", repo=self.root)
        text = p.read_text(encoding="utf-8")
        self.assertNotIn("\n  ", text)
        self.assertEqual(json.loads(text)["units"][uid]["kernel_proof"],
                         "lake build OK; shard")


if __name__ == "__main__":
    unittest.main()
