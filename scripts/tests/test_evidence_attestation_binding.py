"""Regression: every CI-attested kernel_proof reference must resolve locally."""
from __future__ import annotations

import json
import re
from pathlib import Path
import unittest

REPO = Path(__file__).resolve().parents[2]
EVIDENCE = REPO / "data" / "verification_evidence.json"


def committed_runs() -> set[str]:
    runs: set[str] = set()
    for f in sorted((REPO / "data").glob("PROOF_ATTESTATION*.json")):
        d = json.loads(f.read_text(encoding="utf-8"))
        m = re.search(r"actions/runs/(\d+)", str(d.get("workflow_run", "")))
        if m:
            runs.add(m.group(1))
    return runs


class AttestationBindingTests(unittest.TestCase):
    def test_all_ci_kernel_proof_refs_resolve(self):
        ev = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        known = committed_runs()
        stale = []
        for uid, axes in ev.get("units", {}).items():
            m = re.search(r"actions/runs/(\d+)", str(axes.get("kernel_proof", "")))
            if m and m.group(1) not in known:
                stale.append((uid, m.group(1)))
        self.assertEqual(stale, [], f"stale kernel_proof CI refs: {stale[:5]}")

    def test_local_verification_refs_are_explicitly_marked(self):
        ev = json.loads(EVIDENCE.read_text(encoding="utf-8"))
        mixed = [uid for uid, axes in ev.get("units", {}).items()
                 if "LOCAL VERIFICATION" in str(axes.get("kernel_proof", ""))
                 and "actions/runs/" in str(axes.get("kernel_proof", ""))]
        # A local-only claim is explicit; it must never also cite a CI run.
        self.assertEqual(mixed, [], f"ambiguous local/CI kernel claims: {mixed[:5]}")


if __name__ == "__main__":
    unittest.main()
