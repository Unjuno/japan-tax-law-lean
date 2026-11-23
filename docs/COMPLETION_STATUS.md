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
- gate results commit: f0910bc8211f37df14cf05bb4194016df8e14a19
- current HEAD commit: 2bdade23e6be7f53ccda2678c7a11daff7d26fcd
- results bound to this commit: False
- registered checks all green: False

## Axis B — all registered obligations complete

- normative units: 396854
- NOT_STARTED: 396296
- PARTIAL: 0
- PROVED_SCOPE: 3
- FULLY_VERIFIED: 553
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
| partially formalized (spec / impl / tests evidence) | 556 | 396854 |
| kernel proved (CI-attested proof evidence) | 556 | 396854 |
| source-audited (原文 correspondence evidence) | 556 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 556 |
| boundary_proof | 556 |
| cross_law_proof | 556 |
| decomposition_audit | 556 |
| implementation | 556 |
| independent_spec | 556 |
| kernel_proof | 556 |
| proof_scope | 556 |
| source_correspondence_audit | 556 |
| source_location | 556 |
| tests | 556 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- all-complete claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker, any unhandled condition or any pending human review
keeps the all-complete claim FALSE. No claim of legal correctness is made.
