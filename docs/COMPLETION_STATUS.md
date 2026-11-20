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
- gate results commit: (none)
- current HEAD commit: 3e5c7ddaf933883e3b313d5d50888603a875af8c
- results bound to this commit: False
- registered checks all green: False

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396842
- PARTIAL: 1
- PROVED_SCOPE: 0
- FULLY_VERIFIED: 9
- BLOCKED: 2
- units with an open blocker: 2
- units with unhandled conditions: 180618
- human legal reviews recorded: 0/3438 candidates

## Objective §5 coverage layers (separate denominators, never combined)

| layer | units | denominator |
|---|---:|---:|
| all targets (generated normative units) | 396854 | 396854 |
| acquired (pinned source file + SHA-256) | 396852 | 396854 |
| decomposed (exact reconstruction + unique ids) | 396852 | 396854 |
| partially formalized (spec / impl / tests evidence) | 9 | 396854 |
| kernel proved (CI-attested proof evidence) | 10 | 396854 |
| source-audited (原文 correspondence evidence) | 10 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 10 |
| boundary_proof | 10 |
| cross_law_proof | 10 |
| decomposition_audit | 10 |
| implementation | 9 |
| independent_spec | 9 |
| kernel_proof | 10 |
| proof_scope | 10 |
| source_correspondence_audit | 10 |
| source_location | 10 |
| tests | 9 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
