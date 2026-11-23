# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: True
- PASS: 47
- FAIL: 0
- SKIP: 0
- required gates SKIPped: 0
- gate results commit: b3174d0b43566c566ef7c620737c039fbb4135fd
- current HEAD commit: b3174d0b43566c566ef7c620737c039fbb4135fd
- results bound to this commit: True
- registered checks all green: True

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396450
- PARTIAL: 0
- PROVED_SCOPE: 3
- FULLY_VERIFIED: 399
- BLOCKED: 2
- units with an open blocker: 2
- units with unhandled conditions: 180619
- human legal reviews recorded: 0/3438 candidates

## Objective §5 coverage layers (separate denominators, never combined)

| layer | units | denominator |
|---|---:|---:|
| all targets (generated normative units) | 396854 | 396854 |
| acquired (pinned source file + SHA-256) | 396852 | 396854 |
| decomposed (exact reconstruction + unique ids) | 396852 | 396854 |
| partially formalized (spec / impl / tests evidence) | 402 | 396854 |
| kernel proved (CI-attested proof evidence) | 402 | 396854 |
| source-audited (原文 correspondence evidence) | 402 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 402 |
| boundary_proof | 402 |
| cross_law_proof | 402 |
| decomposition_audit | 402 |
| implementation | 402 |
| independent_spec | 402 |
| kernel_proof | 402 |
| proof_scope | 402 |
| source_correspondence_audit | 402 |
| source_location | 402 |
| tests | 402 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
