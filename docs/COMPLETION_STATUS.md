# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: False
- PASS: 0
- FAIL: 0
- SKIP: 0
- required gates SKIPped: 0
- registered checks all green: False

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396851
- PARTIAL: 0
- PROVED_SCOPE: 0
- FULLY_VERIFIED: 1
- BLOCKED: 2
- units with an open blocker: 2
- units with unhandled conditions: 180617
- human legal reviews recorded: 0/3438 candidates

## Evidence axes recorded (separate denominators; units with axis = True)

| axis | units |
|---|---:|
| adversarial_review | 1 |
| boundary_proof | 1 |
| cross_law_proof | 1 |
| decomposition_audit | 1 |
| implementation | 1 |
| independent_spec | 1 |
| kernel_proof | 1 |
| proof_scope | 1 |
| source_correspondence_audit | 1 |
| source_location | 1 |
| tests | 1 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
