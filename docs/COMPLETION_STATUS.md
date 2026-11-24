# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: True
- PASS: 50
- FAIL: 4
- SKIP: 0
- required gates SKIPped: 0
- gate results commit: 545201ab9d995a03aeb47536b6bad40f1fa50b03
- current HEAD commit: f2b1ffa87e90e1a24ebb03e0688014d75fbe6105
- results bound to this commit: False
- registered checks all green: False

## Axis B — all TECHNICAL obligations complete (human review excluded)

- normative units: 396854
- NOT_STARTED: 396140
- PARTIAL: 0
- PROVED_SCOPE: 3
- FULLY_VERIFIED: 709
- BLOCKED: 2
- units with an open blocker: 2
- units with unhandled conditions: 180619

## Axis C — independent human legal determination (separate, not a gate)

- human legal reviews recorded: 0/3438 candidates
- legal review pending: True
- legal determination complete (requires Axis B AND recorded review): False
- pending review never stops formalization, proof or source audit
- no reviewer or approval field may be fabricated by automation

## Objective §5 coverage layers (separate denominators, never combined)

| layer | units | denominator |
|---|---:|---:|
| all targets (generated normative units) | 396854 | 396854 |
| acquired (pinned source file + SHA-256) | 396852 | 396854 |
| decomposed (exact reconstruction + unique ids) | 396852 | 396854 |
| partially formalized (spec / impl / tests evidence) | 712 | 396854 |
| kernel proved (CI-attested proof evidence) | 712 | 396854 |
| source-audited (原文 correspondence evidence) | 712 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 712 |
| boundary_proof | 712 |
| cross_law_proof | 712 |
| decomposition_audit | 712 |
| implementation | 712 |
| independent_spec | 712 |
| kernel_proof | 712 |
| proof_scope | 712 |
| source_correspondence_audit | 712 |
| source_location | 712 |
| tests | 712 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- technical all-complete claimable (still not a legal determination): False
- final legal determination claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker or any unhandled condition keeps the TECHNICAL
all-complete claim FALSE. Pending human review keeps the legal
determination unconfirmed but does not stop formalization. No claim of
legal correctness is made.
