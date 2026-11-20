#!/usr/bin/env python3
"""Regression tests for investigate/fix cycle on the queue invariant gate.

The previous rule required FULLY_VERIFIED == 0, which punished successful
verification. The corrected rule accepts FULLY_VERIFIED only when every evidence
axis is recorded in the committed ledger. These tests pin both directions so
the gate can neither reward unbacked completion nor punish backed completion.
"""
from __future__ import annotations

import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"
# verify_queue_invariants imports normative_core at call time. Without CI on
# sys.path this passes only by accident when another test module imported it.
import sys  # noqa: E402

if str(CI) not in sys.path:
    sys.path.insert(0, str(CI))

spec = importlib.util.spec_from_file_location("qinv", CI / "verify_queue_invariants.py")
qinv = importlib.util.module_from_spec(spec)
spec.loader.exec_module(qinv)

UID = "NORM|" + "a" * 64
AXES = ("source_location", "decomposition_audit", "source_correspondence_audit",
        "independent_spec", "implementation", "kernel_proof", "proof_scope",
        "boundary_proof", "cross_law_proof", "tests", "adversarial_review")


def make_unit(uid, kind, status):
    return {
        "normative_id": uid,
        "law_id": "340AC0000000033",
        "article": "1",
        "source_path": "MainProvision/Article[1]",
        "kind": kind,
        "text": "テスト",
        "status": status,
        "legal_review": "LEGAL_REVIEW_PENDING",
        "owner": "",
        "blockers": [],
        "artifacts": {},
        "obligations": ["kernel_proof"],
        "dependencies": [
            {"type": "law_article", "law_name": "所得税法", "unresolved": False},
            {"type": "enforcement_version", "value": "2026-01-01"},
            {"type": "law_id", "unresolved": True},
        ],
    }


class TestBackingInvariant(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        (self.root / "data").mkdir()
        (self.root / "build").mkdir()
        self.saved_queue, self.saved_repo = qinv.QUEUE, qinv.REPO
        qinv.QUEUE = self.root / "build" / "task_queue.json"
        qinv.REPO = self.root

    def tearDown(self):
        qinv.QUEUE, qinv.REPO = self.saved_queue, self.saved_repo
        self.tmp.cleanup()

    def write_queue(self, status):
        units = [make_unit(UID, "CONDITION", status)]
        for i, kind in enumerate(("EFFECT", "EXCEPTION", "UNRESOLVED", "REFERENCE")):
            units.append(make_unit("NORM|" + str(i + 1).zfill(64), kind, "PARTIAL"))
        qinv.QUEUE.write_text(json.dumps({
            "tasks": units,
            "status_values": ["NOT_STARTED", "PARTIAL", "PROVED_SCOPE",
                              "FULLY_VERIFIED", "BLOCKED"],
            "status_counts": {"FULLY_VERIFIED": 1},
        }, ensure_ascii=False), encoding="utf-8")

    def write_evidence(self, complete):
        record = {axis: ("trace " + axis) for axis in AXES}
        if not complete:
            record["kernel_proof"] = ""
        (self.root / "data" / "verification_evidence.json").write_text(
            json.dumps({"units": {UID: record}}, ensure_ascii=False), encoding="utf-8")

    def test_backed_fully_verified_is_accepted(self):
        self.write_queue("FULLY_VERIFIED")
        self.write_evidence(complete=True)
        self.assertEqual(qinv.main(), 0)

    def test_unbacked_fully_verified_is_rejected(self):
        self.write_queue("FULLY_VERIFIED")
        self.write_evidence(complete=False)
        self.assertEqual(qinv.main(), 1)

    def test_missing_evidence_ledger_is_rejected(self):
        self.write_queue("FULLY_VERIFIED")
        self.assertEqual(qinv.main(), 1)

    def test_not_started_unit_needs_no_evidence(self):
        self.write_queue("NOT_STARTED")
        self.assertEqual(qinv.main(), 0)


if __name__ == "__main__":
    unittest.main()
