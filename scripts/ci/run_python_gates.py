"""Run whichever Python audit gates exist on this branch, honestly.

Design: every branch in the stacked PR series carries only the tooling of its
phase. A later-phase gate must not fail an earlier-phase branch, but absence
of a gate is either expected (phase not reached yet) or a silent hole in the
inventory. This runner:

  * executes each gate that is present on THIS branch,
  * prints SKIP with an explicit reason for each gate not present,
  * exits 0 iff every present gate passes (or none is present), and
  * NEVER counts a SKIP as a PASS.

Sponsor Directive §5 additionally requires that "registered checks passed" is
kept distinct from "all target obligations complete". The completion gate
prints a machine-readable COMPLETE/INCOMPLETE verdict; this runner does not
fold that verdict into its own PASS/FAIL status.
"""
import os
import subprocess
import sys

GATES = [
    ("structural audit tests", ["python", "-m", "unittest", "scripts.tests.test_structural_audit", "-v"], ["scripts/tests/test_structural_audit.py"]),
    ("mutation injection tests", ["python", "-m", "unittest", "scripts.tests.test_mutation_injection", "-v"], ["scripts/tests/test_mutation_injection.py"]),
    ("inventory selection tests", ["python", "-m", "unittest", "scripts.tests.test_inventory_selection", "-v"], ["scripts/tests/test_inventory_selection.py"]),
    ("normative unit / queue tests", ["python", "-m", "unittest", "scripts.tests.test_normative_units", "-v"], ["scripts/tests/test_normative_units.py"]),
    ("cross-law consistency tests", ["python", "-m", "unittest", "scripts.tests.test_cross_law", "-v"], ["scripts/tests/test_cross_law.py"]),
    ("revision impact tests", ["python", "-m", "unittest", "scripts.tests.test_revision_impact", "-v"], ["scripts/tests/test_revision_impact.py"]),
    ("Phase A inventory integrity", ["python", "scripts/law_audit/inventory/validate_inventory.py"], ["scripts/law_audit/inventory/validate_inventory.py"]),
    ("Phase E cross-law pin consistency", ["python", "scripts/law_audit/phase_e/cross_law.py"], ["scripts/law_audit/phase_e/cross_law.py"]),
    ("Phase F revision impact integrity", ["python", "scripts/law_audit/phase_f/revision_impact.py"], ["scripts/law_audit/phase_f/revision_impact.py"]),
    ("Phase B full sweep (325 laws, verified-anomaly gate)", ["python", "scripts/ci/sweep_gate.py"], ["scripts/law_audit/inventory/sweep.py", "scripts/ci/sweep_gate.py"]),
    ("Reference-relation statistics regeneration (Objective §1)", ["python", "scripts/law_audit/inventory/collect_references.py"], ["scripts/law_audit/inventory/collect_references.py"]),
    ("Recursive discovery ledger regeneration gate (Objective §1)", ["python", "scripts/law_audit/inventory/recursive_discovery.py"], ["scripts/law_audit/inventory/recursive_discovery.py", "docs/RECURSIVE_DISCOVERY.md"]),
    ("Per-law status ledger regeneration gate (Objective §1/§6/§7)", ["python", "scripts/ci/law_status_ledger.py"], ["scripts/ci/law_status_ledger.py", "docs/LAW_STATUS.md"]),
    ("Cross-article rate consistency gate (Objective §5)", ["python", "scripts/law_audit/phase_e/rate_consistency.py"], ["scripts/law_audit/phase_e/rate_consistency.py", "docs/RATE_CONSISTENCY.md"]),
    # The queue must exist before any unit-level ledger or diagnostic runs.
    ("Persistent task queue regeneration (Sponsor Directive §3)", ["python", "scripts/ci/task_queue.py"], ["scripts/ci/task_queue.py", "docs/TASK_QUEUE.md"]),
    ("Article verification obligations gate (Objective §4)", ["python", "scripts/ci/article_obligations.py"], ["scripts/ci/article_obligations.py", "docs/ARTICLE_OBLIGATIONS.md"]),
    ("Article-scoped normative-unit diagnostic (Sponsor Directive §4)", ["python", "scripts/law_audit/phase_e/article_scope.py"], ["scripts/law_audit/phase_e/article_scope.py", "docs/ARTICLE_SCOPE.md"]),
    ("Completion reporting gate (Sponsor Directive §5)", ["python", "scripts/ci/completion_gate.py"], ["scripts/ci/completion_gate.py"]),
    ("BLOCKED ledger regeneration gate (Objective §6 out-of-repo prerequisites)", ["python", "scripts/ci/blocked_ledger.py"], ["scripts/ci/blocked_ledger.py", "docs/BLOCKED.md"]),
    ("Coverage ledger regeneration gate (Objective §4 machine-computed coverage)", ["python", "scripts/ci/coverage_ledger.py"], ["scripts/ci/coverage_ledger.py", "docs/COVERAGE.md"]),
    ("L7 ledger regeneration gate", ["python", "scripts/ci/l7_ledger.py"], ["scripts/ci/l7_ledger.py", "docs/L7_LEDGER.md"]),
    ("L7 per-candidate review-state regeneration gate", ["python", "scripts/ci/l7_candidates.py"], ["scripts/ci/l7_candidates.py", "docs/L7_CANDIDATES_UNREVIEWED.csv"]),
    ("L1 transcription audit (pinned raw to model literals)", ["python", "scripts/ci/transcription_audit.py"], ["scripts/ci/transcription_audit.py"]),
    ("Run audit and verify hashes", ["python", "-m", "scripts.law_audit.audit", "--out", "build"], ["scripts/law_audit/audit.py"]),
    ("Generate audit report", ["python", "-m", "scripts.law_audit.report"], ["scripts/law_audit/report.py"]),
]

fails = 0
skips = 0
for name, cmd, paths in GATES:
    missing = [p for p in paths if not os.path.exists(p)]
    if missing:
        print(f"SKIP {name}: missing {missing}")
        skips += 1
        continue
    print(f"RUN  {name}: {' '.join(cmd)}")
    r = subprocess.run(cmd)
    if r.returncode != 0:
        print(f"FAIL {name}: exit {r.returncode}")
        fails += 1
    else:
        print(f"PASS {name}")
if fails:
    print(f"{fails} gate(s) FAILED; {skips} gate(s) SKIPPED (a SKIP is NOT a PASS)")
    sys.exit(1)
print(f"all present gates passed; {skips} gate(s) SKIPPED (a SKIP is NOT a PASS)")
print("registered checks passing != all target obligations complete; see completion gate verdict")
