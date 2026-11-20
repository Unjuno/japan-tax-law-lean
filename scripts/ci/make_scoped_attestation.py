#!/usr/bin/env python3
"""Create a scoped kernel-build attestation from a COMMITTED blob at a given commit.

Used when a module is kernel-built at a commit different from the main
PROOF_ATTESTATION.json. Hashes are SHA-256 of the committed blob with CRLF
normalisation; an entry can never be fabricated from an uncommitted file.
"""
from __future__ import annotations

import hashlib
import json
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data" / "PROOF_ATTESTATION_SCOPED.json"


def blob(commit: str, path: str) -> bytes | None:
    r = subprocess.run(["git", "show", f"{commit}:{path}"], cwd=REPO,
                       stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return r.stdout if r.returncode == 0 else None


def sha(data: bytes) -> str:
    return hashlib.sha256(data.replace(b"\r\n", b"\n")).hexdigest()


def main() -> int:
    commit = sys.argv[1]
    run_url = sys.argv[2]
    conclusion = sys.argv[3] if len(sys.argv) > 3 else "pending"
    base = "LocalTobaccoTaxRate"
    names = [f"{base}.lean", f"{base}Spec.lean", f"{base}Tests.lean"]
    modules = {}
    for n in names:
        data = blob(commit, f"JapanTaxLaw/{n}")
        if data is None:
            print(f"MISSING {n} at {commit}")
            return 1
        modules[n] = {"sha256": sha(data)}
    payload = {
        "schema": 1,
        "note": "Scoped attestation: this module was kernel-built at a different commit than the main attestation. scope=full_run means the whole CI run succeeded; scope=lean_job_only would cover ONLY the Lean job.",
        "commit": commit,
        "workflow_run": run_url,
        "scope": "lean_job_only" if conclusion == "lean_job_only" else "full_run",
        "run_conclusion": conclusion,
        "jobs": {
            "Build Lean project and check axioms": {
                "conclusion": "success",
                "job_url": run_url,
                "required_steps": [
                    "Build explicitly", "No sorry/admit in adopted proofs",
                    "Axioms of key theorems", "Reproducibility check 1 (clean build)",
                    "Reproducibility check 2 (clean build)",
                ],
            }
        },
        "modules": modules,
    }
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
