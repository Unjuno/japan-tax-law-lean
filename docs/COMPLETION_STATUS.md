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
- current HEAD commit: b3caca79b3312e90b55a6bd74b97fe475bfd3bf7
- results bound to this commit: False
- registered checks all green: False

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396841
- PARTIAL: 0
- PROVED_SCOPE: 1
- FULLY_VERIFIED: 10
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
| partially formalized (spec / impl / tests evidence) | 11 | 396854 |
| kernel proved (CI-attested proof evidence) | 11 | 396854 |
| source-audited (原文 correspondence evidence) | 11 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 11 |
| boundary_proof | 11 |
| cross_law_proof | 11 |
| decomposition_audit | 11 |
| implementation | 11 |
| independent_spec | 11 |
| kernel_proof | 11 |
| proof_scope | 11 |
| source_correspondence_audit | 11 |
| source_location | 11 |
| tests | 11 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
