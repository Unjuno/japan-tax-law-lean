# Persistent task queue (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.

One work unit = one normative unit (condition / effect / exception /
fiction / presumption / delegation / reading-substitution / reference /
definition / procedure / transitional / penalty / UNRESOLVED) with an
exact 本則・附則・別表・条項号細目・別表セル locator and a sha256 of the
pinned source fragment. IDs are full 64-hex hashes over law id, history
revision id, structural path, unit kind and content hash.

Persistent state lives in `data/TASK_STATE.json` and is MERGED, never
overwritten: owner, attempts, blockers, evidence artifacts and review
trails survive regeneration and session restarts.

A needle match, a file's existence or a theorem-name string match is
NEVER sufficient for a terminal state; see `scripts/ci/normative_units.py`.

## Counts (separate axes)

- laws in inventory: 327
- normative units generated: 127759
- UNRESOLVED decomposition units: 0
- UNRESOLVED blocks (not schedulable; see build/unresolved_blocks.json): 88939
- units with unresolved source characters: 0
- units with unresolved dependencies: 16792

| completion state | units |
|---|---:|
| NOT_STARTED | 127759 |
| UNRESOLVED | 0 |
| PARTIAL | 0 |
| PROVED_SCOPE | 0 |
| FULLY_VERIFIED | 0 |
| BLOCKED | 0 |

| scope | units |
|---|---:|
| FULL_ARTICLE | 56165 |
| COMPUTABLE_SLICE_ONLY | 71594 |
| UNRESOLVED_SCOPE | 0 |

| unit kind | units |
|---|---:|
| APPLICATION_CONDITION | 10799 |
| DEFINITION | 1212 |
| DELEGATION | 13473 |
| EXCEPTION | 8389 |
| FICTION | 3824 |
| LEGAL_EFFECT | 9146 |
| PENALTY | 676 |
| PRESUMPTION | 87 |
| PROCEDURE | 8336 |
| READING_SUBSTITUTION | 3360 |
| REFERENCE | 65721 |
| TRANSITIONAL | 2736 |

## Sample not-yet-complete units (first 20)

| normative_ref | law_id | article | kind | state |
|---|---|---|---|---|
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[1]/項[1] | LEGAL_EFFECT | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[3]/項[1] | LEGAL_EFFECT | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[3_2]/項[2]/号[3] | DELEGATION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[3_3]/項[2] | DELEGATION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4]/項[1]/号[4] | EXCEPTION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4]/項[1]/号[4] | DELEGATION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4]/項[2]/号[2] | PROCEDURE | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4]/項[2]/号[4] | DELEGATION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4]/項[2]/号[4] | REFERENCE | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4]/項[2]/号[4] | APPLICATION_CONDITION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_3]/項[1]/号[2] | LEGAL_EFFECT | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_3]/項[3] | LEGAL_EFFECT | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_4]/項[1] | DELEGATION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_5]/項[1] | REFERENCE | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_5]/項[1] | EXCEPTION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_5]/項[1] | LEGAL_EFFECT | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_6]/項[1] | DELEGATION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_6]/項[1] | DELEGATION | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_7]/項[1] | REFERENCE | NOT_STARTED |
| `143AC0000000054@143AC0000000054_20260601_508AC00` | 143AC0000000054 | 本則/条[4_7]/項[2] | DELEGATION | NOT_STARTED |
