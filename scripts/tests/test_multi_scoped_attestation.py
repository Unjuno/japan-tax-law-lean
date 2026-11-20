"""Multiple scoped kernel attestations are merged independently and honestly.

Objective §5: each attestation must stay bound to its own green CI run; adding
one module's attestation must not overwrite another module's hash.
"""
import importlib.util
import json
import pathlib
import tempfile
import unittest

REPO = pathlib.Path(__file__).resolve().parents[2]


def load_generator(repo: pathlib.Path):
    spec = importlib.util.spec_from_file_location(
        "ge_multi_" + str(abs(hash(str(repo))))[:6],
        REPO / "scripts/ci/generate_verification_evidence.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    mod.REPO = repo
    mod.ATTESTATION = repo / "data" / "PROOF_ATTESTATION.json"
    return mod


class MultiScopedAttestationTests(unittest.TestCase):
    def test_all_scoped_files_are_merged_without_overwrite(self):
        with tempfile.TemporaryDirectory() as td:
            root = pathlib.Path(td)
            data = root / "data"
            data.mkdir()
            main = {
                "schema": 1, "run_conclusion": "success",
                "commit": "main-commit",
                "jobs": {"Build Lean project and check axioms": {"conclusion": "success"}},
                "modules": {"Alpha.lean": {"sha256": "main-alpha"}},
            }
            (data / "PROOF_ATTESTATION.json").write_text(json.dumps(main), encoding="utf-8")
            scoped = {
                "schema": 1, "run_conclusion": "success", "scope": "full_run",
                "commit": "run-one",
                "jobs": {"Build Lean project and check axioms": {"conclusion": "success"}},
                "modules": {"Alpha.lean": {"sha256": "scoped-alpha"},
                            "Beta.lean": {"sha256": "scoped-beta"}},
            }
            (data / "PROOF_ATTESTATION_SCOPED.json").write_text(json.dumps(scoped), encoding="utf-8")
            other = {
                "schema": 1, "run_conclusion": "success", "scope": "lean_job_only",
                "commit": "run-two",
                "jobs": {"Build Lean project and check axioms": {"conclusion": "success"}},
                "modules": {"Gamma.lean": {"sha256": "scoped-gamma"}},
            }
            (data / "PROOF_ATTESTATION_SCOPED_GAMMA.json").write_text(
                json.dumps(other), encoding="utf-8")

            mod = load_generator(root)
            merged = mod.load_attestation()
            self.assertEqual(merged["modules"]["Alpha.lean"]["sha256"], "main-alpha")
            self.assertEqual(merged["modules"]["Beta.lean"]["sha256"], "scoped-beta")
            self.assertEqual(merged["modules"]["Gamma.lean"]["sha256"], "scoped-gamma")

    def test_failed_scoped_run_is_ignored(self):
        with tempfile.TemporaryDirectory() as td:
            root = pathlib.Path(td)
            data = root / "data"
            data.mkdir()
            (data / "PROOF_ATTESTATION.json").write_text(json.dumps({
                "schema": 1, "run_conclusion": "success", "modules": {},
                "jobs": {"Build Lean project and check axioms": {"conclusion": "success"}},
            }), encoding="utf-8")
            (data / "PROOF_ATTESTATION_SCOPED_BAD.json").write_text(json.dumps({
                "schema": 1, "run_conclusion": "failure", "scope": "full_run",
                "jobs": {"Build Lean project and check axioms": {"conclusion": "failure"}},
                "modules": {"Bad.lean": {"sha256": "must-not-appear"}},
            }), encoding="utf-8")
            mod = load_generator(root)
            self.assertNotIn("Bad.lean", mod.load_attestation()["modules"])


if __name__ == "__main__":
    unittest.main()
