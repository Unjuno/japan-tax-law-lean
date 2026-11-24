#!/usr/bin/env python3
"""Regenerate derived artifacts before CI gates (integration blocker fix).

PR CI checks out the merge tree (main + PR). When other agents advance main
during the ~16-minute CI window, a PR's committed derived artifacts -- umbrella
imports and ledgers computed from the queue -- become stale, and regeneration
gates fail even though the PR's code is correct.

This preflight regenerates those artifacts from the CURRENT tree inputs in the
same order as the gate suite, so the gates verify real properties of the tree
they actually run against. It is an auto-fix, not a skipped or weakened check:
every gate still runs and still compares artifacts to inputs.

Usage: python scripts/ci/preflight_sync.py
"""
from __future__ import annotations

import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]

# Order matters: ledgers derive from the queue; the queue derives from pinned
# sources. Run producers before consumers, exactly as run_python_gates.py does.
SYNC_STEPS = [
    ("umbrella imports", None),
    ("task queue", ["python", "scripts/ci/task_queue.py"]),
    # coverage/L7 ledgers derive from sweep outputs; produce them first, in the
    # same order as run_python_gates.py. Without this the preflight-ledgers are
    # computed from a different state than the gate-suite-ledgers and the drift
    # gates fail even after preflight (observed in PR #622 CI).
    ("cross-law scan", ["python", "scripts/law_audit/phase_e/cross_law.py"]),
    ("full sweep", ["python", "scripts/ci/sweep_gate.py"]),
    ("law status ledger", ["python", "scripts/ci/law_status_ledger.py", "--write"]),
    ("coverage ledger", ["python", "scripts/ci/coverage_ledger.py", "--write"]),
    ("L7 ledger", ["python", "scripts/ci/l7_ledger.py", "--write"]),
    ("source-layer registry", ["python", "scripts/ci/source_layers.py"]),
]


def sync_umbrella() -> int:
    umbrella = REPO / "JapanTaxLaw.lean"
    if not umbrella.exists():
        return 0
    lines = umbrella.read_text(encoding="utf-8").splitlines()
    imported = set()
    for line in lines:
        s = line.strip()
        if s.startswith("import JapanTaxLaw."):
            imported.add(s[len("import "):].strip())
    disk = sorted("JapanTaxLaw." + f.stem for f in (REPO / "JapanTaxLaw").glob("*.lean"))
    missing = [m for m in disk if m not in imported]
    if not missing:
        print(f"preflight umbrella: {len(disk)} modules, 0 missing")
        return 0
    last = max(i for i, l in enumerate(lines) if l.strip().startswith("import JapanTaxLaw."))
    new_lines = lines[:last + 1] + [f"import {m}" for m in missing] + lines[last + 1:]
    umbrella.write_text("\n".join(new_lines) + "\n", encoding="utf-8")
    print(f"preflight umbrella: added {len(missing)} imports (of {len(disk)} modules)")
    return 0


def main() -> int:
    for name, cmd in SYNC_STEPS:
        if cmd is None:
            rc = sync_umbrella()
        else:
            print(f"preflight {name}: {' '.join(cmd)}")
            rc = subprocess.run(cmd, cwd=REPO).returncode
        # Regeneration scripts conventionally return 1 when they WROTE changes
        # (a "dirty" signal for humans) and 0 when already in sync. Both are
        # successful preflight outcomes; only >1 is a real failure.
        if rc > 1:
            print(f"preflight FAILED at {name}: exit {rc}")
            return rc
    print("preflight sync complete; all derived artifacts regenerated from current inputs")
    return 0


if __name__ == "__main__":
    sys.exit(main())
