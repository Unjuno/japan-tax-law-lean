# Completion status (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/completion_gate.py`.

Two independent axes. Registered checks passing is NOT the same as all
obligations being complete. SKIP is never counted as PASS.

## Axis A — registered checks (last recorded gate run)

- results file available: True
- PASS: 54
- FAIL: 0
- SKIP: 0
- required gates SKIPped: 0
- gate results commit: a8f98b5d88d2011c9e30787a3b1f75006fabfdb6
- current HEAD commit: 3a4d672c90a8763164044546dc69fa9ab85053dd
- results bound to this commit: False
- registered checks all green: False

## Axis B — all TECHNICAL obligations complete (human review excluded)

- normative units: 396854
- NOT_STARTED: 395922
- PARTIAL: 0
- PROVED_SCOPE: 1
- FULLY_VERIFIED: 929
- BLOCKED: 2
- units with an open blocker: 2
- units with unhandled conditions: 180617

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
| partially formalized (spec / impl / tests evidence) | 930 | 396854 |
| kernel proved (CI-attested proof evidence) | 930 | 396854 |
| source-audited (原文 correspondence evidence) | 930 | 396854 |
| human reviewed (legal-review axis recorded) | 0 | 396854 |

## Evidence axes recorded (separate denominators; units with a non-empty evidence reference)

| axis | units |
|---|---:|
| adversarial_review | 930 |
| boundary_proof | 930 |
| cross_law_proof | 930 |
| decomposition_audit | 930 |
| implementation | 930 |
| independent_spec | 930 |
| kernel_proof | 930 |
| proof_scope | 930 |
| source_correspondence_audit | 930 |
| source_location | 930 |
| tests | 930 |

## Verdict

- all normative units decomposed, formalized, proved and source-audited: False
- technical all-complete claimable (still not a legal determination): False
- final legal determination claimable: False

An absent results file, any FAIL, any SKIP, any non-FULLY_VERIFIED unit,
any open blocker or any unhandled condition keeps the TECHNICAL
all-complete claim FALSE. Pending human review keeps the legal
determination unconfirmed but does not stop formalization. No claim of
legal correctness is made.
