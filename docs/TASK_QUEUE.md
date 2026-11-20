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
| `e019c84e8e9c47ae` | 143AC0000000054 | Unknown | 1 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `4d34256cec3702fc` | 143AC0000000054 | Unknown | 1 | UNCLASSIFIED | 1 | NOT_STARTED |
| `24ecca5392fdd611` | 143AC0000000054 | Unknown | 1 | REFERENCE | 0 | NOT_STARTED |
| `9f30be42f7f2b888` | 143AC0000000054 | Unknown | 2 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `8dbb6687370c63fe` | 143AC0000000054 | Unknown | 2 | UNCLASSIFIED | 1 | NOT_STARTED |
| `409199d04cc4447a` | 143AC0000000054 | Unknown | 2 | UNCLASSIFIED | 1 | NOT_STARTED |
| `a3e7bbcc5e6bb15c` | 143AC0000000054 | Unknown | 2 | REFERENCE | 0 | NOT_STARTED |
| `95e35b2b3980ee3a` | 143AC0000000054 | Unknown | 3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `b3096aec46ae4d31` | 143AC0000000054 | Unknown | 3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `d87dc0261c860673` | 143AC0000000054 | Unknown | 3 | REFERENCE | 0 | NOT_STARTED |
| `e4ed31793823f680` | 143AC0000000054 | Unknown | 3_2 | EXCEPTION | 0 | NOT_STARTED |
| `64b3457b72b8c426` | 143AC0000000054 | Unknown | 3_2 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `c89a4140aac3acfe` | 143AC0000000054 | Unknown | 3_2 | EXCEPTION | 0 | NOT_STARTED |
| `6a92fa522e0df361` | 143AC0000000054 | Unknown | 3_2 | APPLICATION_CONDITION | 0 | NOT_STARTED |
| `a44855d0f399c11e` | 143AC0000000054 | Unknown | 3_2 | DELEGATION | 0 | NOT_STARTED |
| `d7ed868e34a696cf` | 143AC0000000054 | Unknown | 3_2 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `0f6d17b3f0746dea` | 143AC0000000054 | Unknown | 3_2 | REFERENCE | 0 | NOT_STARTED |
| `187890372b3bd8f5` | 143AC0000000054 | Unknown | 3_3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `72e3ccb7cdd80a43` | 143AC0000000054 | Unknown | 3_3 | LEGAL_EFFECT | 0 | NOT_STARTED |
| `1b0cadea39bfa576` | 143AC0000000054 | Unknown | 3_3 | REFERENCE | 0 | NOT_STARTED |
