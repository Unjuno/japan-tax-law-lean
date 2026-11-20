#!/usr/bin/env python3
"""Regenerate every derived ledger in dependency order (Objective §5).

Drift between generated artifacts and their committed copies has repeatedly
failed CI after evidence/queue changes: L7 ledger, per-law status and coverage
are all derived inputs of later gates. This tool makes regeneration a single,
auditable operation instead of an ad-hoc sequence.

Usage:
  python scripts/ci/regenerate_all_ledgers.py           # regenerate + verify
  python scripts/ci/regenerate_all_ledgers.py --check   # verify only

Exit 0 iff every verification pass is clean. Regeneration commands are allowed
to rewrite their artifacts; the second verification pass must be a no-op.
"""
from __future__ import annotations

import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]

GENERATORS = [
    ("spec scope map", [sys.executable, "scripts/ci/spec_scope_map.py"]),
    ("verification evidence", [sys.executable, "scripts/ci/generate_verification_evidence.py"]),
    ("normative queue", [sys.executable, "scripts/ci/task_queue.py"]),
    ("evidence reference audit", [sys.executable, "scripts/ci/audit_evidence_references.py"]),
    ("article obligations", [sys.executable, "scripts/ci/article_obligations.py"]),
    ("source layer registry", [sys.executable, "scripts/ci/source_layers.py"]),
    ("structural sweep", [sys.executable, "scripts/ci/sweep_gate.py"]),
    ("reference statistics", [sys.executable, "scripts/law_audit/inventory/collect_references.py"]),
    ("L7 ledger", [sys.executable, "scripts/ci/l7_ledger.py", "--write"]),
    ("L7 candidates", [sys.executable, "scripts/ci/l7_candidates.py", "--write"]),
    ("per-law status", [sys.executable, "scripts/ci/law_status_ledger.py"]),
    ("coverage", [sys.executable, "scripts/ci/coverage_ledger.py"]),
    ("completion status", [sys.executable, "scripts/ci/completion_gate.py"]),
]

# Read-only gates used to confirm the regenerated tree is stable.
VERIFIERS = [
    ("queue invariants", [sys.executable, "scripts/ci/verify_queue_invariants.py"]),
    ("L7 ledger", [sys.executable, "scripts/ci/l7_ledger.py"]),
    ("L7 candidates", [sys.executable, "scripts/ci/l7_candidates.py"]),
    ("per-law status", [sys.executable, "scripts/ci/law_status_ledger.py"]),
    ("coverage", [sys.executable, "scripts/ci/coverage_ledger.py"]),
    ("completion status", [sys.executable, "scripts/ci/completion_gate.py"]),
]


def run(cmd: list[str]) -> int:
    p = subprocess.run(cmd, cwd=REPO, capture_output=True, text=True)
    tail = (p.stdout or p.stderr).strip().splitlines()[-1:] or [""]
    print(("PASS " if p.returncode == 0 else "FAIL ") + " ".join(cmd[1:]) + ": " + tail[0][:160])
    return p.returncode


def main() -> int:
    check_only = "--check" in sys.argv
    if not check_only:
        # Two passes: the first writes artifacts whose inputs were regenerated
        # later in the same pass (e.g. per-law status after the sweep).
        for _pass in (1, 2):
            print(f"== regeneration pass {_pass} ==")
            for name, cmd in GENERATORS:
                run(cmd)
    fails = 0
    print("== verification ==")
    for name, cmd in VERIFIERS:
        fails += run(cmd)
    print(f"derived-ledger verification: {'CLEAN' if fails == 0 else str(fails) + ' FAILURE(S)'}")
    return 1 if fails else 0


if __name__ == "__main__":
    raise SystemExit(main())
