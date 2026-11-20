"""Regression tests for the art.38 evidence pipeline (genuine artifacts only)."""
from __future__ import annotations

import hashlib
import json
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))
import generate_per_capita_evidence as gen  # noqa: E402
import normative_core as core  # noqa: E402

UNIT = gen.UNIT_ID


def attestation(commit="test", conclusion="success", job="success", hashes=None):
    mods = {}
    for n in ("PerCapitaEqualRate.lean", "PerCapitaEqualRateSpec.lean",
              "PerCapitaEqualRateTests.lean"):
        b = (REPO / "JapanTaxLaw" / n).read_bytes().replace(b"\r\n", b"\n")
        mods[n] = {"sha256": (hashes or {}).get(n, hashlib.sha256(b).hexdigest())}
    return {
        "schema": 1, "commit": commit,
        "workflow_run": "https://example.invalid/run/1",
        "run_conclusion": conclusion,
        "jobs": {"Build Lean project and check axioms": {"conclusion": job}},
        "modules": mods,
    }


class EvidenceTests(unittest.TestCase):
    def setUp(self):
        self._attest = gen.ATTEST
        self._td = tempfile.TemporaryDirectory()
        gen.ATTEST = Path(self._td.name) / "att.json"

    def tearDown(self):
        gen.ATTEST = self._attest
        self._td.cleanup()

    def test_missing_attestation_yields_no_evidence(self):
        self.assertIsNone(gen.build())

    def test_malformed_attestation_fails_closed(self):
        gen.ATTEST.write_text('{"schema": 1, "run_concl', encoding="utf-8")
        self.assertIsNone(gen.verify_attestation())
        self.assertIsNone(gen.build())

    def test_exact_statutory_value_extraction(self):
        extracted = gen.statutory_amount("個人の均等割の標準税率は、千円とする。")
        self.assertEqual(extracted, (1000, "千"))
        # A substring search would accept 10000; exact parsing must not.
        self.assertEqual(gen.defined_amount("def specRateYen : Nat := 10000", "specRateYen"), 10000)
        self.assertEqual(gen.defined_amount("def standardRate : Money := 1_000", "standardRate"), 1000)
        self.assertNotEqual(
            gen.defined_amount("def specRateYen : Nat := 10000", "specRateYen"),
            extracted[0])

    def test_failed_run_yields_no_evidence(self):
        gen.ATTEST.write_text(json.dumps(attestation(conclusion="failure")), encoding="utf-8")
        self.assertIsNone(gen.build())

    def test_failed_lean_job_yields_no_evidence(self):
        gen.ATTEST.write_text(json.dumps(attestation(job="failure")), encoding="utf-8")
        self.assertIsNone(gen.build())

    def test_wrong_blob_hash_yields_no_evidence(self):
        a = attestation(hashes={"PerCapitaEqualRate.lean": "0" * 64})
        gen.ATTEST.write_text(json.dumps(a), encoding="utf-8")
        self.assertIsNone(gen.build())

    def test_valid_attestation_gives_all_axes_and_full_status(self):
        gen.ATTEST.write_text(json.dumps(attestation()), encoding="utf-8")
        ev = gen.build()
        self.assertIsInstance(ev, dict)
        self.assertEqual(set(ev), set(core.EVIDENCE_AXES))
        self.assertTrue(all(ev.values()))
        st, errs = core.derive_status(
            {"blockers": [], "status": "NOT_STARTED", "unhandled_conditions": []}, ev)
        self.assertEqual(st, core.STATUS_FULLY_VERIFIED)
        self.assertEqual(errs, [])


if __name__ == "__main__":
    unittest.main()
