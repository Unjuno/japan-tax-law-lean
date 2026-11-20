"""Run Python audit gates on this branch, honestly.

Design: every branch in the stacked PR series carries only the tooling of its
phase. A later-phase gate must not fail an earlier-phase branch, but absence
of a gate is either expected (phase not reached yet) or a silent hole.

Objective §5 requires that a SKIPPED *required* check is never treated as a
PASS. This runner therefore:
  * executes each gate present on THIS branch,
  * prints SKIP with an explicit reason for each gate not present,
  * fails when a gate in REQUIRED_GATES is absent or skipped,
  * exits 0 only if every present gate passes and no required gate is skipped.
"""
import os
import subprocess
import sys

GATES = [
    ("structural audit tests", ["python", "-m", "unittest", "scripts.tests.test_structural_audit", "-v"], ["scripts/tests/test_structural_audit.py"]),
    ("norm identity unit tests", ["python", "-m", "unittest", "scripts.tests.test_norm_identity", "-v"], ["scripts/tests/test_norm_identity.py", "scripts/ci/norm_identity.py"]),
    ("mutation injection tests", ["python", "-m", "unittest", "scripts.tests.test_mutation_injection", "-v"], ["scripts/tests/test_mutation_injection.py"]),
    ("inventory selection tests", ["python", "-m", "unittest", "scripts.tests.test_inventory_selection", "-v"], ["scripts/tests/test_inventory_selection.py"]),
    ("cross-law consistency tests", ["python", "-m", "unittest", "scripts.tests.test_cross_law", "-v"], ["scripts/tests/test_cross_law.py"]),
    ("revision impact tests", ["python", "-m", "unittest", "scripts.tests.test_revision_impact", "-v"], ["scripts/tests/test_revision_impact.py"]),
    ("Phase A inventory integrity", ["python", "scripts/law_audit/inventory/validate_inventory.py"], ["scripts/law_audit/inventory/validate_inventory.py"]),
    ("Phase E cross-law pin consistency", ["python", "scripts/law_audit/phase_e/cross_law.py"], ["scripts/law_audit/phase_e/cross_law.py"]),
    ("Phase F revision impact integrity", ["python", "scripts/law_audit/phase_f/revision_impact.py"], ["scripts/law_audit/phase_f/revision_impact.py"]),
    ("Phase B full sweep (325 laws, verified-anomaly gate)", ["python", "scripts/ci/sweep_gate.py"], ["scripts/law_audit/inventory/sweep.py", "scripts/ci/sweep_gate.py"]),
    ("Reference-relation statistics regeneration (Objective §1)", ["python", "scripts/law_audit/inventory/collect_references.py"], ["scripts/law_audit/inventory/collect_references.py"]),
    ("Recursive discovery ledger regeneration gate (Objective §1)", ["python", "scripts/law_audit/inventory/recursive_discovery.py"], ["scripts/law_audit/inventory/recursive_discovery.py", "docs/RECURSIVE_DISCOVERY.md"]),
    ("Per-law status ledger regeneration gate (Objective §1/§6/§7)", ["python", "scripts/ci/law_status_ledger.py"], ["scripts/ci/law_status_ledger.py", "docs/LAW_STATUS.md"]),
    ("Norm-unit verification obligations gate (Objective §1/§4)", ["python", "scripts/ci/article_obligations.py"], ["scripts/ci/article_obligations.py", "scripts/ci/norm_identity.py", "docs/ARTICLE_OBLIGATIONS.md"]),
    ("Cross-article rate consistency gate (Objective §5)", ["python", "scripts/law_audit/phase_e/rate_consistency.py"], ["scripts/law_audit/phase_e/rate_consistency.py", "docs/RATE_CONSISTENCY.md"]),
    ("Norm-unit persistent task queue regeneration (Objective §1)", ["python", "scripts/ci/task_queue.py"], ["scripts/ci/task_queue.py", "scripts/ci/norm_identity.py", "docs/TASK_QUEUE.md"]),
    ("Norm-unit scoped fidelity diagnostic (Objective §1)", ["python", "scripts/law_audit/phase_e/article_scope.py"], ["scripts/law_audit/phase_e/article_scope.py", "docs/ARTICLE_SCOPE.md"]),
    ("BLOCKED ledger regeneration gate (Objective §6)", ["python", "scripts/ci/blocked_ledger.py"], ["scripts/ci/blocked_ledger.py", "docs/BLOCKED.md"]),
    ("Coverage ledger regeneration gate (Objective §4)", ["python", "scripts/ci/coverage_ledger.py"], ["scripts/ci/coverage_ledger.py", "docs/COVERAGE.md"]),
    ("L7 ledger regeneration gate", ["python", "scripts/ci/l7_ledger.py"], ["scripts/ci/l7_ledger.py", "docs/L7_LEDGER.md"]),
    ("L7 per-candidate review-state regeneration gate", ["python", "scripts/ci/l7_candidates.py"], ["scripts/ci/l7_candidates.py", "docs/L7_CANDIDATES_UNREVIEWED.csv"]),
    ("L1 transcription audit (pinned raw to model literals)", ["python", "scripts/ci/transcription_audit.py"], ["scripts/ci/transcription_audit.py"]),
    ("Run audit and verify hashes", ["python", "-m", "scripts.law_audit.audit", "--out", "build"], ["scripts/law_audit/audit.py"]),
    ("Generate audit report", ["python", "-m", "scripts.law_audit.report"], ["scripts/law_audit/report.py"]),
]

# Checks whose absence is a hole in verification, not a legitimate phase gap.
REQUIRED_GATES = {
    "norm identity unit tests",
    "Norm-unit verification obligations gate (Objective §1/§4)",
    "Norm-unit persistent task queue regeneration (Objective §1)",
    "Norm-unit scoped fidelity diagnostic (Objective §1)",
    "L1 transcription audit (pinned raw to model literals)",
    "Run audit and verify hashes",
}

fails = 0
skipped_required = []
ran = []
for name, cmd, paths in GATES:
    missing = [p for p in paths if not os.path.exists(p)]
    if missing:
        print("SKIP %s: missing %s" % (name, missing))
        if name in REQUIRED_GATES:
            skipped_required.append(name)
        continue
    print("RUN  %s: %s" % (name, " ".join(cmd)))
    r = subprocess.run(cmd)
    ran.append(name)
    if r.returncode != 0:
        print("FAIL %s: exit %d" % (name, r.returncode))
        fails += 1
    else:
        print("PASS %s" % name)

if skipped_required:
    print("FAIL required gates SKIPPED (never counted as PASS): %s"
          % ", ".join(skipped_required))
    fails += len(skipped_required)

print("gates executed: %d; gates skipped: %d; gates failed: %d"
      % (len(ran), len(GATES) - len(ran), fails))
if fails:
    print("%d gate(s) FAILED" % fails)
    sys.exit(1)
print("all present gates passed; no required gate skipped")
