# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: True
- PASS: 46
- FAIL: 0
- SKIP: 0
- required gates SKIPped: 0
- gate results commit: 317f5bba74edd304313c7f466459fee687be20b3
- current HEAD commit: 317f5bba74edd304313c7f466459fee687be20b3
- results bound to this commit: True
- registered checks all green: True

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396624
- PARTIAL: 0
- PROVED_SCOPE: 2
- FULLY_VERIFIED: 226
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
| partially formalized (spec / impl / tests evidence) | 228 | 396854 |
| kernel proved (CI-attested proof evidence) | 228 | 396854 |
| source-audited (原文 correspondence evidence) | 228 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 228 |
| boundary_proof | 228 |
| cross_law_proof | 228 |
| decomposition_audit | 228 |
| implementation | 228 |
| independent_spec | 228 |
| kernel_proof | 228 |
| proof_scope | 228 |
| source_correspondence_audit | 228 |
| source_location | 228 |
| tests | 228 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
