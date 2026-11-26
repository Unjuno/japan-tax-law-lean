# Persistent normative task queue (machine-generated)

Do not hand-edit. Regenerate: `python scripts/ci/task_queue.py`.

Every pinned provision (本則 / 附則 / 別表) is decomposed into
position-tracked normative units. A numeric match, a file name or a
theorem-name string can never make a unit verified; status is derived
only from recorded evidence in `data/verification_evidence.json`.

- inventory snapshot: 2026-11-15
- laws in inventory: 327
- normative work units: 268107
- units with unresolved conditions: 139841
- provisions mechanically reconstructed: 62981/62981

## Status counts (distinct axes — not a completion claim)

| status | units |
|---|---:|
| NOT_STARTED | 260300 |
| PARTIAL | 4312 |
| PROVED_SCOPE | 79 |
| FULLY_VERIFIED | 3414 |
| BLOCKED | 2 |
| STALE | 0 |

## Verification axes required for FULLY_VERIFIED

SOURCE_LOCATION, SOURCE_CORRESPONDENCE_AUDIT, DECOMPOSITION_AUDIT, SPEC_INDEPENDENT, IMPLEMENTATION, PROOF_SOUNDNESS, PROOF_SCOPE, PROOF_BOUNDARY, TESTS, ADVERSARIAL_REVIEW

Conditional (only when resolved dependencies exist): PROOF_CROSS_LAW.
Human legal review is a separate axis (`LEGAL_REVIEW_PENDING` by default).
Coverage audit is mechanical only: `MECHANICAL_COVERAGE_ONLY_NOT_SEMANTIC_AUDIT`.

The machine-readable projection is `build/task_queue.json` (derived).
Durable ownership/status/blockers are in `data/task_state.json`.
