# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: True
- PASS: 43
- FAIL: 3
- SKIP: 0
- required gates SKIPped: 0
- gate results commit: 0704f6985e48ba1764b2a3ea0754bcb2770bbdad
- current HEAD commit: 0704f6985e48ba1764b2a3ea0754bcb2770bbdad
- results bound to this commit: True
- registered checks all green: False

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396649
- PARTIAL: 0
- PROVED_SCOPE: 2
- FULLY_VERIFIED: 201
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
| partially formalized (spec / impl / tests evidence) | 203 | 396854 |
| kernel proved (CI-attested proof evidence) | 203 | 396854 |
| source-audited (原文 correspondence evidence) | 203 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 203 |
| boundary_proof | 203 |
| cross_law_proof | 203 |
| decomposition_audit | 203 |
| implementation | 203 |
| independent_spec | 203 |
| kernel_proof | 203 |
| proof_scope | 203 |
| source_correspondence_audit | 203 |
| source_location | 203 |
| tests | 203 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
