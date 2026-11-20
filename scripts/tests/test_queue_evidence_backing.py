"""Regression tests for evidence-backed FULLY_VERIFIED in the queue gate.

A bare `FULLY_VERIFIED` string is not completion.  The gate must reject an
unbacked status, reject a partially backed status, and reject a count mismatch,
while accepting a unit whose evidence ledger covers every obligation axis.
All other invariants are made to pass in the fixture so that a failure can
only come from the evidence-backing check under test.
"""
from __future__ import annotations

import json
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
GATE = REPO / "scripts" / "ci" / "verify_queue_invariants.py"
AXES = (
    "source_location", "decomposition_audit", "source_correspondence_audit",
    "independent_spec", "implementation", "kernel_proof", "proof_scope",
    "boundary_proof", "cross_law_proof", "tests", "adversarial_review",
)
KINDS = ("EFFECT", "CONDITION", "REFERENCE", "UNRESOLVED")


def unit(seed: str, status: str, kind: str) -> dict:
    uid = (seed * 64)[:64]
    return {
        "normative_id": "NORM|" + uid,
        "law_id": "325AC0000000001",
        "article": "第一条",
        "source_path": "data/raw/sample.json#Article:1",
        "kind": kind,
        "kinds": ["UNRESOLVED"] if kind == "UNRESOLVED" else [kind],
        "text": "納める。",
        "dependencies": [
            {"type": "enforcement_version", "target": "rev-1"},
            {"type": "law_article", "target": "第一条"},
        ],
        "obligations": list(AXES),
        "owner": "",
        "blockers": [],
        "artifacts": {},
        "legal_review": "LEGAL_REVIEW_PENDING",
        "status": status,
    }


def fixture(verified_status: str):
    units = [unit(ch, verified_status if i == 0 else "NOT_STARTED", KINDS[i])
             for i, ch in enumerate("abcd")]
    return units


class EvidenceBackingGateTests(unittest.TestCase):
    def run_gate(self, units: list[dict], evidence: dict, full_count: int):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            gate = root / "scripts" / "ci" / "verify_queue_invariants.py"
            gate.parent.mkdir(parents=True)
            shutil.copyfile(GATE, gate)
            (root / "build").mkdir()
            (root / "data").mkdir()
            payload = {
                "status_values": ["NOT_STARTED", "PARTIAL", "PROVED_SCOPE",
                                  "FULLY_VERIFIED", "BLOCKED"],
                "status_counts": {
                    "NOT_STARTED": sum(u["status"] == "NOT_STARTED" for u in units),
                    "PARTIAL": 0, "PROVED_SCOPE": 0,
                    "FULLY_VERIFIED": full_count, "BLOCKED": 0,
                },
                "legal_review_axis": "independent; never auto-satisfied",
                "tasks": units,
            }
            (root / "build" / "task_queue.json").write_text(
                json.dumps(payload, ensure_ascii=False), encoding="utf-8")
            (root / "data" / "verification_evidence.json").write_text(
                json.dumps({"units": evidence}, ensure_ascii=False), encoding="utf-8")
            proc = subprocess.run([sys.executable, str(gate)],
                                  capture_output=True, text=True)
            return proc

    def test_backed_completion_is_accepted(self):
        units = fixture("FULLY_VERIFIED")
        rec = {axis: "artifact/" + axis for axis in AXES}
        proc = self.run_gate(units, {units[0]["normative_id"]: rec}, 1)
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        self.assertIn("every FULLY_VERIFIED is evidence-backed - "
                      "FULLY_VERIFIED=1 backed=1/1", proc.stdout)

    def test_unbacked_completion_is_rejected(self):
        units = fixture("FULLY_VERIFIED")
        proc = self.run_gate(units, {}, 1)
        self.assertEqual(proc.returncode, 1, proc.stdout)
        self.assertIn("FAIL every FULLY_VERIFIED is evidence-backed", proc.stdout)

    def test_partially_backed_completion_is_rejected(self):
        units = fixture("FULLY_VERIFIED")
        rec = {axis: "artifact/" + axis for axis in AXES if axis != "kernel_proof"}
        proc = self.run_gate(units, {units[0]["normative_id"]: rec}, 1)
        self.assertEqual(proc.returncode, 1, proc.stdout)
        self.assertIn("backed=0/1", proc.stdout)

    def test_count_mismatch_is_rejected(self):
        units = fixture("FULLY_VERIFIED")
        rec = {axis: "artifact/" + axis for axis in AXES}
        proc = self.run_gate(units, {units[0]["normative_id"]: rec}, 2)
        self.assertEqual(proc.returncode, 1, proc.stdout)

    def test_zero_completions_is_accepted(self):
        units = fixture("NOT_STARTED")
        proc = self.run_gate(units, {}, 0)
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)


if __name__ == "__main__":
    unittest.main()
