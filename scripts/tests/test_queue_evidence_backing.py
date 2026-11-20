"""Regression tests for evidence-backed FULLY_VERIFIED in the queue gate.

Completion must be backed by an independent evidence ledger: a bare status
string, a file name or a theorem name is never completion.  These fixtures
keep all other invariants passing so a failure can only come from the
evidence-backing check itself.
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
CORE = REPO / "scripts" / "ci" / "normative_core.py"
AXES = (
    "source_location", "decomposition_audit", "source_correspondence_audit",
    "independent_spec", "implementation", "kernel_proof", "proof_scope",
    "boundary_proof", "cross_law_proof", "tests", "adversarial_review",
)
KINDS = ("EFFECT", "CONDITION", "REFERENCE", "UNRESOLVED")


def unit(seed: str, status: str, kind: str) -> dict:
    return {
        "normative_id": "NORM|" + (seed * 64)[:64],
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


class EvidenceBackingGateTests(unittest.TestCase):
    def run_gate(self, units: list[dict], evidence: dict):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            gate = root / "scripts" / "ci" / "verify_queue_invariants.py"
            gate.parent.mkdir(parents=True)
            shutil.copyfile(GATE, gate)
            # The gate imports the canonical core for EVIDENCE_AXES; the temp
            # fixture must carry that module too.
            shutil.copyfile(CORE, gate.parent / "normative_core.py")
            (root / "build").mkdir()
            (root / "data").mkdir()
            verified = sum(u["status"] == "FULLY_VERIFIED" for u in units)
            payload = {
                "status_values": ["NOT_STARTED", "PARTIAL", "PROVED_SCOPE",
                                  "FULLY_VERIFIED", "BLOCKED"],
                "status_counts": {
                    "NOT_STARTED": sum(u["status"] == "NOT_STARTED" for u in units),
                    "PARTIAL": 0, "PROVED_SCOPE": 0,
                    "FULLY_VERIFIED": verified, "BLOCKED": 0,
                },
                "legal_review_axis": "independent; never auto-satisfied",
                "tasks": units,
            }
            (root / "build" / "task_queue.json").write_text(
                json.dumps(payload, ensure_ascii=False), encoding="utf-8")
            (root / "data" / "verification_evidence.json").write_text(
                json.dumps({"units": evidence}, ensure_ascii=False), encoding="utf-8")
            return subprocess.run([sys.executable, str(gate)],
                                  capture_output=True, text=True)

    def test_backed_completion_is_accepted(self):
        units = [unit("a", "FULLY_VERIFIED", KINDS[0])] + [
            unit(ch, "NOT_STARTED", KINDS[i]) for i, ch in enumerate("bcd", 1)]
        rec = {axis: "artifact/" + axis for axis in AXES}
        proc = self.run_gate(units, {units[0]["normative_id"]: rec})
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        self.assertIn("PASS every FULLY_VERIFIED is evidence-backed", proc.stdout)

    def test_unbacked_completion_is_rejected(self):
        units = [unit("a", "FULLY_VERIFIED", KINDS[0])] + [
            unit(ch, "NOT_STARTED", KINDS[i]) for i, ch in enumerate("bcd", 1)]
        proc = self.run_gate(units, {})
        self.assertEqual(proc.returncode, 1, proc.stdout)
        self.assertIn("FAIL every FULLY_VERIFIED is evidence-backed", proc.stdout)

    def test_partially_backed_completion_is_rejected(self):
        units = [unit("a", "FULLY_VERIFIED", KINDS[0]),
                 unit("b", "FULLY_VERIFIED", KINDS[1])] + [
            unit(ch, "NOT_STARTED", KINDS[i]) for i, ch in enumerate("cd", 2)]
        complete = {axis: "artifact/" + axis for axis in AXES}
        partial = dict(complete)
        partial["kernel_proof"] = ""
        proc = self.run_gate(units, {
            units[0]["normative_id"]: complete,
            units[1]["normative_id"]: partial,
        })
        self.assertEqual(proc.returncode, 1, proc.stdout)

    def test_zero_completions_is_accepted(self):
        units = [unit(ch, "NOT_STARTED", KINDS[i]) for i, ch in enumerate("abcd")]
        proc = self.run_gate(units, {})
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)


if __name__ == "__main__":
    unittest.main()
