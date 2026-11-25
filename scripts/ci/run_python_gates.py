"""Run the Python audit gates, honestly distinguishing SKIP from PASS.

SKIP is never counted as PASS. A gate that is mandatory for the completion
verdict but absent is a FAIL ("required gate is absent (SKIP is not PASS)").
Passing registered checks is still distinct from all target obligations being
complete; the completion verdict is derived from recorded evidence elsewhere.
"""
import os
import subprocess
import sys

strict = True  # a required gate that is absent is a FAIL, never a silent PASS

REQUIRED_GATES = {
    "structural audit tests",
    "mutation injection tests",
    "normative infrastructure tests",
    "Lean kernel audit (necessary not sufficient)",
    "Evidence linking (pinned needles to compiled modules)",
    "Coordinator source-audit cycle (H/T/D/C/U)",
    "Persistent task queue regeneration (Objective §1)",
    "Article verification obligations gate (Objective §4)",
    "Article-scoped fidelity diagnostic (Objective §4)",
    "L1 transcription audit (pinned raw to model literals)",
}

GATES = [
    ("structural audit tests", ["python", "-m", "unittest", "scripts.tests.test_structural_audit", "-v"], ["scripts/tests/test_structural_audit.py"]),
    ("mutation injection tests", ["python", "-m", "unittest", "scripts.tests.test_mutation_injection", "-v"], ["scripts/tests/test_mutation_injection.py"]),
    ("inventory selection tests", ["python", "-m", "unittest", "scripts.tests.test_inventory_selection", "-v"], ["scripts/tests/test_inventory_selection.py"]),
    ("cross-law consistency tests", ["python", "-m", "unittest", "scripts.tests.test_cross_law", "-v"], ["scripts/tests/test_cross_law.py"]),
    ("revision impact tests", ["python", "-m", "unittest", "scripts.tests.test_revision_impact", "-v"], ["scripts/tests/test_revision_impact.py"]),
    ("normative infrastructure tests", ["python", "-m", "unittest", "scripts.tests.test_normative_infrastructure", "-v"], ["scripts/tests/test_normative_infrastructure.py"]),
    ("Lean kernel audit (necessary not sufficient)", ["python", "scripts/ci/lean_kernel_audit.py"], ["scripts/ci/lean_kernel_audit.py"]),
    ("completion-gate adversary tests", ["python", "-m", "unittest", "scripts.tests.test_completion_gate_adversary", "-v"], ["scripts/tests/test_completion_gate_adversary.py"]),
    ("Phase A inventory integrity", ["python", "scripts/law_audit/inventory/validate_inventory.py"], ["scripts/law_audit/inventory/validate_inventory.py"]),
    ("Phase E cross-law pin consistency", ["python", "scripts/law_audit/phase_e/cross_law.py"], ["scripts/law_audit/phase_e/cross_law.py"]),
    ("Phase F revision impact integrity", ["python", "scripts/law_audit/phase_f/revision_impact.py"], ["scripts/law_audit/phase_f/revision_impact.py"]),
    ("Phase B full sweep (325 laws, verified-anomaly gate)", ["python", "scripts/ci/sweep_gate.py"], ["scripts/law_audit/inventory/sweep.py", "scripts/ci/sweep_gate.py"]),
    ("Reference-relation statistics regeneration (Objective §1)", ["python", "scripts/law_audit/inventory/collect_references.py"], ["scripts/law_audit/inventory/collect_references.py"]),
    ("Recursive discovery ledger regeneration gate (Objective §1)", ["python", "scripts/law_audit/inventory/recursive_discovery.py"], ["scripts/law_audit/inventory/recursive_discovery.py", "docs/RECURSIVE_DISCOVERY.md"]),
    ("Discovered target-law ledger gate (Objective §2 non-税 scope)", ["python", "scripts/law_audit/inventory/discovery_ledger.py"], ["scripts/law_audit/inventory/discovery_ledger.py", "docs/DISCOVERED_LAWS.md"]),
    ("Local ordinance target ledger gate (Objective §2 municipality layer)", ["python", "scripts/law_audit/inventory/local_ordinance_ledger.py"], ["scripts/law_audit/inventory/local_ordinance_ledger.py", "data/local_governments.json", "docs/LOCAL_ORDINANCE_COVERAGE.md"]),
    ("Historical revision pinning ledger gate (Objective §2)", ["python", "scripts/law_audit/inventory/historical_revision_ledger.py"], ["scripts/law_audit/inventory/historical_revision_ledger.py", "data/historical_revision_pins.json", "data/historical_law_snapshots.json", "docs/HISTORICAL_REVISIONS.md"]),
    ("Per-law status ledger regeneration gate (Objective §1/§6/§7)", ["python", "scripts/ci/law_status_ledger.py"], ["scripts/ci/law_status_ledger.py", "docs/LAW_STATUS.md"]),
    ("Article verification obligations gate (Objective §4)", ["python", "scripts/ci/article_obligations.py"], ["scripts/ci/article_obligations.py", "docs/ARTICLE_OBLIGATIONS.md"]),
    ("Cross-article rate consistency gate (Objective §5)", ["python", "scripts/law_audit/phase_e/rate_consistency.py"], ["scripts/law_audit/phase_e/rate_consistency.py", "docs/RATE_CONSISTENCY.md"]),
    ("Persistent task queue regeneration (Objective §1)", ["python", "scripts/ci/task_queue.py"], ["scripts/ci/task_queue.py", "docs/TASK_QUEUE.md"]),
    ("Evidence linking (pinned needles to compiled modules)", ["python", "scripts/ci/link_existing_proofs.py"], ["scripts/ci/link_existing_proofs.py"]),
    ("Coordinator source-audit cycle (H/T/D/C/U)", ["python", "scripts/ci/coordinator_cycle.py", "3"], ["scripts/ci/coordinator_cycle.py"]),
    ("Article-scoped fidelity diagnostic (Objective §4)", ["python", "scripts/law_audit/phase_e/article_scope.py"], ["scripts/law_audit/phase_e/article_scope.py", "docs/ARTICLE_SCOPE.md"]),
    ("BLOCKED ledger regeneration gate (Objective §6)", ["python", "scripts/ci/blocked_ledger.py"], ["scripts/ci/blocked_ledger.py", "docs/BLOCKED.md"]),
    ("Coverage ledger regeneration gate (Objective §4)", ["python", "scripts/ci/coverage_ledger.py"], ["scripts/ci/coverage_ledger.py", "docs/COVERAGE.md"]),
    ("L7 ledger regeneration gate", ["python", "scripts/ci/l7_ledger.py"], ["scripts/ci/l7_ledger.py", "docs/L7_LEDGER.md"]),
    ("L7 per-candidate review-state regeneration gate", ["python", "scripts/ci/l7_candidates.py"], ["scripts/ci/l7_candidates.py", "docs/L7_CANDIDATES_UNREVIEWED.csv"]),
    ("L1 transcription audit (pinned raw to model literals)", ["python", "scripts/ci/transcription_audit.py"], ["scripts/ci/transcription_audit.py"]),
    ("Run audit and verify hashes", ["python", "-m", "scripts.law_audit.audit", "--out", "build"], ["scripts/law_audit/audit.py"]),
    ("Generate audit report", ["python", "-m", "scripts.law_audit.report"], ["scripts/law_audit/report.py"]),
]

fails = 0
passes = 0
skips = []
for name, cmd, paths in GATES:
    missing = [p for p in paths if not os.path.exists(p)]
    if missing:
        if name in REQUIRED_GATES:
            print(f"FAIL {name}: required gate is absent (SKIP is not PASS): {missing}")
            fails += 1
        else:
            print(f"SKIP {name}: missing {missing} (SKIP is not PASS)")
            skips.append(name)
        continue
    print(f"RUN  {name}: {' '.join(cmd)}")
    r = subprocess.run(cmd)
    if r.returncode != 0:
        print(f"FAIL {name}: exit {r.returncode}")
        fails += 1
    else:
        print(f"PASS {name}")
        passes += 1

print(f"summary: PASS={passes} SKIP={len(skips)} FAIL={fails}")
if skips:
    print("skipped gates (NOT counted as PASS): " + ", ".join(skips))
print("registered checks passing != all target obligations complete")
if fails:
    print(f"{fails} gate(s) FAILED")
    sys.exit(1)
print("all present gates passed")
