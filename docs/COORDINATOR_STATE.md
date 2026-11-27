# Coordinator state (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/coordinator.py`.

Loop: INSPECT -> SELECT -> FORMALIZE -> PROVE -> CHALLENGE -> VERIFY -> COMMIT -> REPEAT

- queue units: 0
- statuses: 
- selected this iteration: 0
- blocked by dependency/blocker: 0 (reported, not stopping the queue)
- human legal review: LEGAL_REVIEW_PENDING, separate axis; never a filter or a formalization gate

| role | assigned unit ids |
|---|---|
| FORMALIZE | — |
| PROVE | — |
| CHALLENGE | — |
| VERIFY | — |

Role separation: the formalizer writes spec + implementation, the prover writes kernel bridges/tests, and the challenger writes an independent module-specific H/T/D/C/U review. One unit is assigned to one role at a time; claims prevent parallel edits of the same artifact.

Machine-readable assignment packets: `build/coordinator_assignments.json`.
