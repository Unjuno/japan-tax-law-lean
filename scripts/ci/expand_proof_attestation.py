#!/usr/bin/env python3
"""Extend the kernel-build attestation from one real, successful CI run.

The attestation records module blob hashes at a commit whose
"Build Lean project and check axioms" CI job succeeded.  A module is added
here ONLY when its implementation, independent spec and tests files are
byte-identical (SHA-256 after CRLF normalisation) to the blobs at that commit.
That is the same check `generate_verification_evidence.kernel_attested` makes,
so an entry is never fabricated from a file that CI did not build.

No proof claim is made here: this script only binds existing CI evidence to
additional module hashes.  It refuses to run when the attestation's run
conclusion is not `success` or when the commit is unavailable locally.

Regenerate with `python scripts/ci/expand_proof_attestation.py`.
"""
from __future__ import annotations

import hashlib
import json
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
ATTEST = REPO / "data" / "PROOF_ATTESTATION.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
sys.path.insert(0, str(Path(__file__).resolve().parent))
import normative_core as core  # noqa: E402


def sha(data: bytes) -> str:
    return hashlib.sha256(data.replace(b"\r\n", b"\n")).hexdigest()


def git_blob(commit: str, path: str) -> bytes | None:
    r = subprocess.run(
        ["git", "show", f"{commit}:{path}"],
        cwd=REPO, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
    )
    return r.stdout if r.returncode == 0 else None


def module_bases() -> list[str]:
    import importlib.util
    spec = importlib.util.spec_from_file_location("epa_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    out = []
    for name, _law, _kind, _art, _needles in mod.checks():
        import re
        m = re.search(r"(\w+)\.lean", name)
        if not m:
            continue
        base = m.group(1)
        if not base.endswith(("Spec", "Tests")) and base not in out:
            out.append(base)
    return out


def main() -> int:
    att = json.loads(ATTEST.read_text(encoding="utf-8"))
    if att.get("run_conclusion") != "success":
        print("refusing: attestation CI run is not successful")
        return 1
    commit = att.get("commit", "")
    if not commit:
        print("refusing: attestation has no commit")
        return 1
    first = git_blob(commit, "README.md")
    if first is None:
        print(f"refusing: attested commit {commit} not available locally")
        return 1

    modules = dict(att.get("modules", {}))
    added, skipped = [], 0
    for base in module_bases():
        names = [f"{base}.lean", f"{base}Spec.lean", f"{base}Tests.lean"]
        if all(n in modules for n in names):
            continue
        blobs = {}
        ok = True
        for name in names:
            p = REPO / "JapanTaxLaw" / name
            old = git_blob(commit, f"JapanTaxLaw/{name}")
            if not p.exists() or old is None or sha(p.read_bytes()) != sha(old):
                ok = False
                break
            blobs[name] = {"sha256": sha(old)}
        if not ok:
            skipped += 1
            continue
        modules.update(blobs)
        added.append(base)

    att["modules"] = dict(sorted(modules.items()))
    text = json.dumps(att, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    if ATTEST.read_text(encoding="utf-8") == text:
        print(f"attestation matches committed state ({len(modules)} module files; {len(added)} new)")
    else:
        ATTEST.write_text(text, encoding="utf-8")
        print(f"attestation expanded: +{len(added)} modules, {len(modules)} files total, {skipped} skipped")
    return 0


if __name__ == "__main__":
    sys.exit(main())
