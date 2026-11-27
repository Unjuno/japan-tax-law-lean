# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: True
- PASS: 33
- FAIL: 0
- SKIP: 0
- required gates SKIPped: 0
- registered checks all green: True

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 378510
- PARTIAL: 0
- PROVED_SCOPE: 0
- FULLY_VERIFIED: 18342
- BLOCKED: 2
- units with an open blocker: 2
- units with unhandled conditions: 180617
- human legal reviews recorded: 0/3438 candidates

## Objective §5 coverage layers (separate denominators, never combined)

| layer | units | denominator |
|---|---:|---:|
| all targets (generated normative units) | 396854 | 396854 |
| acquired (pinned source file + SHA-256) | 396852 | 396854 |
| decomposed (exact reconstruction + unique ids) | 396852 | 396854 |
| partially formalized (spec / impl / tests evidence) | 18342 | 396854 |
| kernel proved (CI-attested proof evidence) | 18342 | 396854 |
| source-audited (原文 correspondence evidence) | 18342 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 18342 |
| boundary_proof | 18342 |
| cross_law_proof | 18342 |
| decomposition_audit | 18342 |
| implementation | 18342 |
| independent_spec | 18342 |
| kernel_proof | 18342 |
| proof_scope | 18342 |
| source_correspondence_audit | 18342 |
| source_location | 18342 |
| tests | 18342 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
