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
- NOT_STARTED: 395718
- PARTIAL: 0
- PROVED_SCOPE: 967
- FULLY_VERIFIED: 167
- BLOCKED: 2
- units with an open blocker: 2
- units with unhandled conditions: 180617
- human legal reviews recorded: 0/3438 candidates

## Evidence axes recorded (separate denominators; units with a non-empty reference)

| axis | units |
|---|---:|
| adversarial_review | 317 |
| boundary_proof | 1134 |
| decomposition_audit | 1134 |
| implementation | 1134 |
| independent_spec | 1134 |
| kernel_proof | 1134 |
| proof_scope | 1134 |
| source_correspondence_audit | 1134 |
| source_location | 1134 |
| tests | 1134 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
