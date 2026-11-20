# Persistent normative-unit task queue (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.

Directive §1: one durable work unit per decomposed norm unit. The
identity binds law id, revision/history id, 本則/附則/別表, article,
paragraph, item, subitem, appendix cell, norm kind, unit ordinal, exact
source span, pinned source digest and text digest with a full SHA-256.
A numeric match, file existence or theorem-name string is a weak hint
only and can never produce a verification status.

- snapshot: 2026-11-15
- laws in inventory: 327
- norm units generated: 289583
- unresolved units: 42338
- decomposition coverage gaps: 0

## Verification status (evidence-derived, independent axes)

| status | count |
|---|---:|
| NOT_STARTED | 289583 |
| PARTIAL | 0 |
| PROVED_SCOPE | 0 |
| FULLY_VERIFIED | 0 |
| BLOCKED | 0 |
| STALE | 0 |

Human legal review is a SEPARATE axis (`LEGAL_REVIEW_PENDING`); it is
never auto-satisfied and never folded into a verification status.

## Norm-unit kinds

| kind | count |
|---|---:|
| APPLICATION_CONDITION | 64428 |
| LEGAL_EFFECT | 53542 |
| EXCEPTION | 29020 |
| DEEMING | 5821 |
| PRESUMPTION | 156 |
| DELEGATION | 25719 |
| READING_SUBSTITUTION | 4612 |
| REFERENCE | 63947 |
| UNCLASSIFIED | 42338 |
| UNRESOLVED | 0 |

## Persistence and completion semantics

Owner, blockers, artifacts, attempts and review evidence are stored in
the git-tracked `data/task_state.json` and merged on regeneration.
`FULLY_VERIFIED` requires every mechanical evidence axis in
`data/verification_evidence.json` and no unresolved condition. A bare
15-digit id is only one dependency signal, never a complete analysis.

## Sample unfinished units (first 20)

| unit (short) | law_id | kind | article | norm type | unresolved | status |
|---|---|---|---|---|---:|---|
| `afd0c6b6a770d1ec` | 143AC0000000054 | Main | 1 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `5ee9d94fa69ee0dd` | 143AC0000000054 | Main | 1 | UNCLASSIFIED | 1 | NOT_STARTED |
| `364d0f63fdca609a` | 143AC0000000054 | Main | 1 | REFERENCE | 0 | NOT_STARTED |
| `ab7112697fa42850` | 143AC0000000054 | Main | 2 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `bd73602760ea0b1d` | 143AC0000000054 | Main | 2 | UNCLASSIFIED | 1 | NOT_STARTED |
| `1614e04efd1c8453` | 143AC0000000054 | Main | 2 | UNCLASSIFIED | 1 | NOT_STARTED |
| `4b8446a62810cf79` | 143AC0000000054 | Main | 2 | REFERENCE | 0 | NOT_STARTED |
| `f48d93e1087fd8a1` | 143AC0000000054 | Main | 3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `e4f34a509bd0ffe0` | 143AC0000000054 | Main | 3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `e198952392571cd9` | 143AC0000000054 | Main | 3 | REFERENCE | 0 | NOT_STARTED |
| `0f134a4b0863baa6` | 143AC0000000054 | Main | 3_2 | EXCEPTION | 0 | NOT_STARTED |
| `f2d43e67926f312f` | 143AC0000000054 | Main | 3_2 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `7e5a885a143e5388` | 143AC0000000054 | Main | 3_2 | EXCEPTION | 0 | NOT_STARTED |
| `33232482870a4870` | 143AC0000000054 | Main | 3_2 | APPLICATION_CONDITION | 0 | NOT_STARTED |
| `09a9d340cc34c67a` | 143AC0000000054 | Main | 3_2 | DELEGATION | 0 | NOT_STARTED |
| `3ea570a761b8122c` | 143AC0000000054 | Main | 3_2 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `b923dd97d43ee62a` | 143AC0000000054 | Main | 3_2 | REFERENCE | 0 | NOT_STARTED |
| `1ea8cff3afaef397` | 143AC0000000054 | Main | 3_3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `b349e61e5234fa7a` | 143AC0000000054 | Main | 3_3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `f7d7f63559b7ed66` | 143AC0000000054 | Main | 3_3 | REFERENCE | 0 | NOT_STARTED |
