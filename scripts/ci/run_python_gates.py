"""Run the Python audit gates on this branch, honestly.

SKIP is never counted as PASS.  Every gate listed in REQUIRED_GATES must be
present and passing; a missing required gate is a FAILURE, not a silent hole.
Optional/phase-gated checks that are genuinely absent print SKIP with an
explicit reason and do not affect the exit status.

This distinction is required by the objective: "registered checks succeeded"
and "all target obligations are complete" are different claims, and a skipped
check must never be reported as a passed one.
"""
import json
import os
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
GATE_RESULTS = REPO / "build" / "gate_results.json"

GATES = [
    ("structural audit tests", ["python", "-m", "unittest", "scripts.tests.test_structural_audit", "-v"], ["scripts/tests/test_structural_audit.py"]),
    ("mutation injection tests", ["python", "-m", "unittest", "scripts.tests.test_mutation_injection", "-v"], ["scripts/tests/test_mutation_injection.py"]),
    ("inventory selection tests", ["python", "-m", "unittest", "scripts.tests.test_inventory_selection", "-v"], ["scripts/tests/test_inventory_selection.py"]),
    ("cross-law consistency tests", ["python", "-m", "unittest", "scripts.tests.test_cross_law", "-v"], ["scripts/tests/test_cross_law.py"]),
    ("revision impact tests", ["python", "-m", "unittest", "scripts.tests.test_revision_impact", "-v"], ["scripts/tests/test_revision_impact.py"]),
    ("normative core (queue/completion) tests", ["python", "-m", "unittest", "scripts.tests.test_normative_core", "-v"], ["scripts/tests/test_normative_core.py"]),
    ("completion gate adversary tests", ["python", "-m", "unittest", "scripts.tests.test_completion_gate_adversary", "-v"], ["scripts/tests/test_completion_gate_adversary.py"]),
    ("completion gate adversarial (full §1 rule set)", ["python", "scripts/ci/completion_gate_adversarial.py"], ["scripts/ci/completion_gate_adversarial.py", "docs/COMPLETION_GATE_ADVERSARIAL.md"]),
    ("task selector computable ranking tests", ["python", "-m", "unittest", "scripts.tests.test_task_selector", "-v"], ["scripts/tests/test_task_selector.py", "scripts/ci/task_selector.py"]),
    ("gate result provenance tests", ["python", "-m", "unittest", "scripts.tests.test_gate_provenance", "-v"], ["scripts/tests/test_gate_provenance.py", "scripts/ci/completion_gate.py"]),
    ("queue invariant gate regression tests", ["python", "-m", "unittest", "scripts.tests.test_queue_invariants", "-v"], ["scripts/tests/test_queue_invariants.py", "scripts/ci/verify_queue_invariants.py"]),
    ("multi-scoped attestation merge tests", ["python", "-m", "unittest", "scripts.tests.test_multi_scoped_attestation", "-v"], ["scripts/tests/test_multi_scoped_attestation.py"]),
    ("generated ledger input-guard tests", ["python", "-m", "unittest", "scripts.tests.test_generated_ledger_guards", "-v"], ["scripts/tests/test_generated_ledger_guards.py"]),
    ("article-scope D/C decision tests", ["python", "-m", "unittest", "scripts.tests.test_article_scope_decision", "-v"], ["scripts/tests/test_article_scope_decision.py"]),
    ("historical-discovery classification tests", ["python", "-m", "unittest", "scripts.tests.test_historical_discovery", "-v"], ["scripts/tests/test_historical_discovery.py"]),
    ("independent completion-mechanism audit", ["python", "scripts/ci/qa_completion_audit.py"], ["scripts/ci/qa_completion_audit.py"]),
    ("evidence reference resolution audit", ["python", "scripts/ci/audit_evidence_references.py"], ["scripts/ci/audit_evidence_references.py", "docs/EVIDENCE_REFERENCE_AUDIT.md", "data/EVIDENCE_REFERENCE_AUDIT.json"]),
    ("Phase A inventory integrity", ["python", "scripts/law_audit/inventory/validate_inventory.py"], ["scripts/law_audit/inventory/validate_inventory.py"]),
    ("Phase E cross-law pin consistency", ["python", "scripts/law_audit/phase_e/cross_law.py"], ["scripts/law_audit/phase_e/cross_law.py"]),
    ("Phase F revision impact integrity", ["python", "scripts/law_audit/phase_f/revision_impact.py"], ["scripts/law_audit/phase_f/revision_impact.py"]),
    ("Phase B full sweep (325 laws, verified-anomaly gate)", ["python", "scripts/ci/sweep_gate.py"], ["scripts/law_audit/inventory/sweep.py", "scripts/ci/sweep_gate.py"]),
    ("Reference-relation statistics regeneration (Objective §1)", ["python", "scripts/law_audit/inventory/collect_references.py"], ["scripts/law_audit/inventory/collect_references.py"]),
    ("Recursive discovery ledger regeneration gate (Objective §1)", ["python", "scripts/law_audit/inventory/recursive_discovery.py"], ["scripts/law_audit/inventory/recursive_discovery.py", "docs/RECURSIVE_DISCOVERY.md"]),
    ("Recursive discovery law-id resolution tests (Objective §2)", ["python", "-m", "unittest", "scripts.tests.test_recursive_discovery_resolve", "-v"], ["scripts/tests/test_recursive_discovery_resolve.py"]),
    ("Recursive discovery law-id resolution gate (Objective §2)", ["python", "scripts/law_audit/inventory/recursive_discovery_resolve.py"], ["scripts/law_audit/inventory/recursive_discovery_resolve.py", "docs/RECURSIVE_DISCOVERY_RESOLVED.md"]),
    ("Related-law separate-layer acquisition tests (Objective §2)", ["python", "-m", "unittest", "scripts.tests.test_related_law_acquisition", "-v"], ["scripts/tests/test_related_law_acquisition.py", "data/RELATED_LAW_LEDGER.json"]),
    ("Per-law status ledger regeneration gate (Objective §1/§6/§7)", ["python", "scripts/ci/law_status_ledger.py"], ["scripts/ci/law_status_ledger.py", "docs/LAW_STATUS.md"]),
    ("spec-scope mapping regression tests", ["python", "-m", "unittest", "scripts.tests.test_spec_scope_map", "-v"], ["scripts/tests/test_spec_scope_map.py"]),
    ("evidence scope/attestation fixes tests", ["python", "-m", "unittest", "scripts.tests.test_evidence_scope_fixes", "-v"], ["scripts/tests/test_evidence_scope_fixes.py"]),
    ("Explicit spec-scope mapping (Directive §1.5)", ["python", "scripts/ci/spec_scope_map.py"], ["scripts/ci/spec_scope_map.py", "data/SPEC_SCOPE_MAP.json"]),
    ("Verification evidence regeneration (Directive §1 evidences FULLY_VERIFIED)", ["python", "scripts/ci/generate_verification_evidence.py"], ["scripts/ci/generate_verification_evidence.py", "data/PROOF_ATTESTATION.json", "data/verification_evidence.json", "data/SPEC_SCOPE_MAP.json"]),
    # The queue must be regenerated BEFORE any gate that reads build/task_queue.json
    # (article_obligations.py reads it). Otherwise a stale or partially written
    # queue makes a correct obligations gate fail with a JSONDecodeError.
    ("Persistent task queue regeneration (Sponsor Directive §3)", ["python", "scripts/ci/task_queue.py"], ["scripts/ci/task_queue.py", "docs/TASK_QUEUE.md"]),
    ("Directive §2 eight-axis ledger tests", ["python", "-m", "unittest", "scripts.tests.test_directive_axes", "-v"], ["scripts/tests/test_directive_axes.py", "scripts/ci/directive_axes.py"]),
    ("Directive §2 eight-axis ledger regeneration", ["python", "scripts/ci/directive_axes.py"], ["scripts/ci/directive_axes.py", "data/DIRECTIVE_AXES.json", "docs/DIRECTIVE_AXES.md"]),
    ("Coordinator loop tests (Sponsor Directive §3)", ["python", "-m", "unittest", "scripts.tests.test_coordinator", "-v"], ["scripts/tests/test_coordinator.py", "scripts/ci/coordinator.py"]),
    ("Coordinator state regeneration gate (Sponsor Directive §3)", ["python", "scripts/ci/coordinator.py", "--check"], ["scripts/ci/coordinator.py", "data/COORDINATOR_STATE.json", "docs/COORDINATOR_STATE.md"]),
    ("normative queue invariants (unique ids, status vocabulary)", ["python", "scripts/ci/verify_queue_invariants.py"], ["scripts/ci/verify_queue_invariants.py"]),
    ("merged verified artifacts retained (no stale-base deletion)", ["python", "scripts/ci/verify_merged_artifacts.py"], ["scripts/ci/verify_merged_artifacts.py", "data/MERGED_ARTIFACT_MANIFEST.json"]),
    ("merged artifact guard tests", ["python", "-m", "unittest", "scripts.tests.test_merged_artifact_guard", "-v"], ["scripts/tests/test_merged_artifact_guard.py"]),
    ("Article verification obligations gate (Objective §4)", ["python", "scripts/ci/article_obligations.py"], ["scripts/ci/article_obligations.py", "docs/ARTICLE_OBLIGATIONS.md"]),
    ("Cross-article rate consistency gate (Objective §5)", ["python", "scripts/law_audit/phase_e/rate_consistency.py"], ["scripts/law_audit/phase_e/rate_consistency.py", "docs/RATE_CONSISTENCY.md"]),

    ("Article-scoped fidelity diagnostic (Sponsor Directive §4)", ["python", "scripts/law_audit/phase_e/article_scope.py"], ["scripts/law_audit/phase_e/article_scope.py", "docs/ARTICLE_SCOPE.md"]),
    # BLOCKED.md must be regenerated BEFORE source_layers.py, which parses its
    # reviewer/ordinance counts; the reverse order consumed a stale input.
    ("BLOCKED backlog ledger regeneration gate (Directive §1 non-blocking)", ["python", "scripts/ci/blocked_ledger.py"], ["scripts/ci/blocked_ledger.py", "docs/BLOCKED.md"]),
    ("Source-layer management tests (Directive §1 in-scope backlogs)", ["python", "-m", "unittest", "scripts.tests.test_source_layers", "-v"], ["scripts/tests/test_source_layers.py", "scripts/ci/source_layers.py"]),
    ("Separate source-layer registry (Objective §2)", ["python", "scripts/ci/source_layers.py"], ["scripts/ci/source_layers.py", "docs/SOURCE_LAYERS.md"]),
    ("In-scope source backlog tests (Directive §1/§5)", ["python", "-m", "unittest", "scripts.tests.test_source_backlog", "-v"], ["scripts/tests/test_source_backlog.py", "scripts/ci/source_backlog.py"]),
    ("In-scope source backlog regeneration gate", ["python", "scripts/ci/source_backlog.py"], ["scripts/ci/source_backlog.py", "data/SOURCE_BACKLOG.json", "docs/SOURCE_BACKLOG.md"]),
    ("Unverified reference candidate layer (Directive §5)", ["python", "scripts/ci/reference_candidates.py"], ["scripts/ci/reference_candidates.py", "data/REFERENCE_NAME_CANDIDATES.json", "docs/REFERENCE_NAME_CANDIDATES.md"]),
    ("Coverage ledger regeneration gate (Objective §4 machine-computed coverage)", ["python", "scripts/ci/coverage_ledger.py"], ["scripts/ci/coverage_ledger.py", "docs/COVERAGE.md"]),
    ("L7 ledger regeneration gate", ["python", "scripts/ci/l7_ledger.py"], ["scripts/ci/l7_ledger.py", "docs/L7_LEDGER.md"]),
    ("L7 per-candidate review-state regeneration gate", ["python", "scripts/ci/l7_candidates.py"], ["scripts/ci/l7_candidates.py", "docs/L7_CANDIDATES_UNREVIEWED.csv"]),
    ("L7 per-candidate H/T/D/C/U tests (Objective §5)", ["python", "-m", "unittest", "scripts.tests.test_l7_htcu", "-v"], ["scripts/tests/test_l7_htcu.py"]),
    ("Candidate H/T/D/C/U ledger gate (Sponsor Directive §5)", ["python", "scripts/ci/candidate_htdcu.py"], ["scripts/ci/candidate_htdcu.py", "docs/CANDIDATE_HTDCU.md"]),
    ("Progress ledger gate (Directive §5: count reductions, not models)", ["python", "scripts/ci/progress_ledger.py"], ["scripts/ci/progress_ledger.py", "docs/PROGRESS_DELTA.md", "data/PROGRESS_HISTORY.json"]),
    ("L1 transcription audit (pinned raw to model literals)", ["python", "scripts/ci/transcription_audit.py"], ["scripts/ci/transcription_audit.py"]),
    ("Run audit and verify hashes", ["python", "-m", "scripts.law_audit.audit", "--out", "build"], ["scripts/law_audit/audit.py"]),
    ("Generate audit report", ["python", "-m", "scripts.law_audit.report"], ["scripts/law_audit/report.py"]),
]

# SKIP is never PASS for these.  The queue/completion machinery is the first
# execution task of the directive and must exist on every branch.
REQUIRED_GATES = {
    "normative core (queue/completion) tests",
    "completion gate adversary tests",
    "completion gate adversarial (full §1 rule set)",
    "task selector computable ranking tests",
    "gate result provenance tests",
    "queue invariant gate regression tests",
    "multi-scoped attestation merge tests",
    "generated ledger input-guard tests",
    "article-scope D/C decision tests",
    "independent completion-mechanism audit",
    "evidence reference resolution audit",
    "normative queue invariants (unique ids, status vocabulary)",
    "merged verified artifacts retained (no stale-base deletion)",
    "merged artifact guard tests",
    "spec-scope mapping regression tests",
    "Explicit spec-scope mapping (Directive §1.5)",
    "Verification evidence regeneration (Directive §1 evidences FULLY_VERIFIED)",
    "Persistent task queue regeneration (Sponsor Directive §3)",
    "Directive §2 eight-axis ledger tests",
    "Directive §2 eight-axis ledger regeneration",
    "Coordinator loop tests (Sponsor Directive §3)",
    "Coordinator state regeneration gate (Sponsor Directive §3)",
    "Source-layer management tests (Directive §1 in-scope backlogs)",
    "Separate source-layer registry (Objective §2)",
    "In-scope source backlog tests (Directive §1/§5)",
    "In-scope source backlog regeneration gate",
    "Unverified reference candidate layer (Directive §5)",
    "Article verification obligations gate (Objective §4)",
    "Article-scoped fidelity diagnostic (Sponsor Directive §4)",
    "L1 transcription audit (pinned raw to model literals)",
}

# All five verification states are distinct and must be represented.  A scoped
# proof (PROVED_SCOPE) is never an article proof (FULLY_VERIFIED), and a missing
# check is BLOCKED/NOT_STARTED rather than PASS.
STATUS_VOCABULARY = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED")

fails = 0
ran = 0
skipped = 0
records = []
for name, cmd, paths in GATES:
    required = name in REQUIRED_GATES
    missing = [p for p in paths if not os.path.exists(p)]
    if missing:
        skipped += 1
        reason = "missing " + ", ".join(missing)
        records.append({"name": name, "verdict": "SKIP", "required": required,
                        "reason": reason})
        if required:
            print(f"FAIL {name}: REQUIRED gate skipped (missing {missing}); SKIP is never PASS")
            fails += 1
        else:
            print(f"SKIP {name}: missing {missing}")
        continue
    print(f"RUN  {name}: {' '.join(cmd)}")
    ran += 1
    r = subprocess.run(cmd)
    verdict = "PASS" if r.returncode == 0 else "FAIL"
    records.append({"name": name, "verdict": verdict, "required": required,
                    "reason": "exit 0" if r.returncode == 0 else f"exit {r.returncode}"})
    if r.returncode != 0:
        print(f"FAIL {name}: exit {r.returncode}")
        fails += 1
    else:
        print(f"PASS {name}")

# Machine-readable verdicts for the completion gate. This is the ONLY input to
# the "registered checks" axis; SKIP stays SKIP and is never merged into PASS.
# Bind the result to the immutable commit it was produced from: a result from a
# concurrently edited working tree must not be reported as green against HEAD.
try:
    _head = subprocess.run(["git", "rev-parse", "HEAD"], capture_output=True,
                           text=True, check=False)
    HEAD_SHA = _head.stdout.strip() if _head.returncode == 0 else ""
except (OSError, ValueError):
    HEAD_SHA = ""
payload = {
    "tool": "scripts/ci/run_python_gates.py",
    "commit_sha": HEAD_SHA,
    "gates": records,
    "summary": {"pass": ran - fails, "fail": fails, "skip": skipped},
}
blob = json.dumps(payload, ensure_ascii=False, indent=2)
GATE_RESULTS.parent.mkdir(parents=True, exist_ok=True)
GATE_RESULTS.write_text(blob, encoding="utf-8")
if HEAD_SHA:
    (GATE_RESULTS.parent / f"gate_results_{HEAD_SHA}.json").write_text(blob, encoding="utf-8")
if fails:
    print(f"{fails} gate(s) FAILED; {ran} ran, {skipped} skipped (SKIP is never PASS)")
    sys.exit(1)
print(f"all present gates passed ({ran} ran, {skipped} honestly skipped; SKIP is never PASS)")
