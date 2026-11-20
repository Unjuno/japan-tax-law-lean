# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: True
- PASS: 38
- FAIL: 0
- SKIP: 0
- required gates SKIPped: 0
- gate results commit: b717c0e1a4baae0c8844515b4b8f1cb1628262e9
- current HEAD commit: b717c0e1a4baae0c8844515b4b8f1cb1628262e9
- results bound to this commit: True
- registered checks all green: True

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396843
- PARTIAL: 1
- PROVED_SCOPE: 0
- FULLY_VERIFIED: 8
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
| partially formalized (spec / impl / tests evidence) | 8 | 396854 |
| kernel proved (CI-attested proof evidence) | 9 | 396854 |
| source-audited (原文 correspondence evidence) | 9 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 9 |
| boundary_proof | 9 |
| cross_law_proof | 9 |
| decomposition_audit | 9 |
| implementation | 8 |
| independent_spec | 8 |
| kernel_proof | 9 |
| proof_scope | 9 |
| source_correspondence_audit | 9 |
| source_location | 9 |
| tests | 8 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
