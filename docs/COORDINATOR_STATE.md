# Coordinator state (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/coordinator.py`.

Loop: INSPECT -> SELECT -> FORMALIZE -> PROVE -> CHALLENGE -> VERIFY -> COMMIT -> REPEAT

- queue units: 396854
- statuses: BLOCKED=2, FULLY_VERIFIED=877, NOT_STARTED=395974, PROVED_SCOPE=1
- selected this iteration: 12
- blocked by dependency/blocker: 67 (reported, not stopping the queue)
- human legal review: LEGAL_REVIEW_PENDING, separate axis; never a filter or a formalization gate

| role | assigned unit ids |
|---|---|
| FORMALIZE | NORM|04b6d44ade06008d19d, NORM|e78f6d9b6656ad2f410, NORM|048aa353ea02c717841, NORM|3c03970b97325aebc96, NORM|3f2a8da12d2428d8dec (+7) |
| PROVE | — |
| CHALLENGE | — |
| VERIFY | — |

Role separation: the formalizer writes spec + implementation, the prover writes kernel bridges/tests, and the challenger writes an independent module-specific H/T/D/C/U review. One unit is assigned to one role at a time; claims prevent parallel edits of the same artifact.

Machine-readable assignment packets: `build/coordinator_assignments.json`.
