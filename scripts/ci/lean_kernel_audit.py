#!/usr/bin/env python3
"""Run the Lean kernel build and forbidden-proof audit as a registered check.

This records a NECESSARY but NOT SUFFICIENT condition: the kernel accepted all
tracked modules and no `sorry`/`admit`/axiom placeholders were found. It does
NOT map a build success to any normative unit, and it never marks a unit
verified. Per-unit evidence still requires source-fidelity and spec/proof
correspondence records in data/verification_evidence.json.
"""
from __future__ import annotations

import json
import os
import subprocess
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "build" / "lean_kernel_audit.json"
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")


def find_lake() -> str:
    for candidate in ("lake", str(Path.home() / ".elan" / "bin" / "lake.exe"),
                      str(Path.home() / ".elan" / "bin" / "lake")):
        try:
            r = subprocess.run([candidate, "--version"], capture_output=True, text=True)
            if r.returncode == 0:
                return candidate
        except OSError:
            continue
    return ""


def scan_sources() -> list[str]:
    import re
    findings = []
    for p in sorted((REPO / "JapanTaxLaw").glob("*.lean")):
        text = p.read_text(encoding="utf-8")
        text = re.sub(r"/-.*?-/", "", text, flags=re.S)
        text = re.sub(r"--[^\n]*", "", text)
        for token in FORBIDDEN:
            if re.search(rf"\b{re.escape(token)}\b", text):
                findings.append(f"{p.name}:{token}")
    return findings


def main() -> int:
    lake = find_lake()
    build_rc = None
    build_tail = ""
    if lake:
        r = subprocess.run([lake, "build"], cwd=REPO, capture_output=True, text=True)
        build_rc = r.returncode
        build_tail = (r.stdout + r.stderr).strip().splitlines()[-1] if (r.stdout + r.stderr).strip() else ""
    forbidden = scan_sources()
    payload = {
        "tool": "scripts/ci/lean_kernel_audit.py",
        "date": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "lake_found": bool(lake),
        "lake_build_exit_code": build_rc,
        "build_last_line": build_tail[-300:],
        "forbidden_proof_markers": forbidden,
        "pass": build_rc == 0 and not forbidden,
        "claim": "NECESSARY_NOT_SUFFICIENT_NO_PER_UNIT_VERIFICATION",
    }
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"lean kernel audit: pass={payload['pass']} build_exit={build_rc} "
          f"forbidden={len(forbidden)}")
    return 0 if payload["pass"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
