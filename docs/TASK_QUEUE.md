# Norm-unit task queue (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.

Objective §1: every normative unit of every pinned provision is a
durable work unit with a collision-free id, exact source locator,
independent decomposition, dependency channels and a five-valued status.
Human legal review is a separate axis and is never auto-satisfied.

## Totals

- laws in inventory: 327
- law snapshots with provisions: 325
- norm units generated: 548437
- unresolved norm units: 324348
- units failing independent coverage audit: 0
- persisted state records: 0
- orphaned state records (source redesigned): 0

## Status distribution (distinct states, not a completion percentage)

| status | units |
|---|---:|
| NOT_STARTED | 548437 |
| PARTIAL | 0 |
| PROVED_SCOPE | 0 |
| FULLY_VERIFIED | 0 |
| BLOCKED | 0 |

## Norm-unit kinds

| kind | units |
|---|---:|
| APPLICATION_CONDITION | 17159 |
| DEEMING | 5985 |
| DELEGATION | 24790 |
| EXCEPTION | 33010 |
| LEGAL_EFFECT | 16261 |
| PRESUMPTION | 51 |
| READING_SUBSTITUTION | 6859 |
| REFERENCE | 119974 |
| UNRESOLVED_NORM | 324348 |

## Status vocabulary and completion rule

- `NOT_STARTED`: no obligation satisfied.
- `PARTIAL`: at least one technical obligation satisfied, but not all.
- `PROVED_SCOPE`: all technical obligations satisfied, human review pending.
- `FULLY_VERIFIED`: all technical obligations AND recorded human legal review.
- `BLOCKED`: an explicit blocker is recorded (e.g. source changed).

A numeric needle match, a file's existence or a theorem-name string match
alone can never produce `FULLY_VERIFIED`. `SKIPPED` is never counted as PASS.

## Sample units (first 20 by generation order)

| norm_id | law_id | article | kind | status |
|---|---|---|---|---|
| `b87af186514712c2f0dfec66` | 143AC0000000054 | 1 | UNRESOLVED_NORM | NOT_STARTED |
| `f468518f2740b938b126c903` | 143AC0000000054 | 1 | REFERENCE | NOT_STARTED |
| `d7df5aa0e65d4491b55c15be` | 143AC0000000054 | 2 | UNRESOLVED_NORM | NOT_STARTED |
| `b78a5a0bb596ad0f549c7f33` | 143AC0000000054 | 2 | REFERENCE | NOT_STARTED |
| `70895444f3dde68c09a104ea` | 143AC0000000054 | 2 | UNRESOLVED_NORM | NOT_STARTED |
| `2cacb6083d58005cc0b61757` | 143AC0000000054 | 3 | UNRESOLVED_NORM | NOT_STARTED |
| `43493f36554ddc45a4f42e28` | 143AC0000000054 | 3 | UNRESOLVED_NORM | NOT_STARTED |
| `b9fe6946f1224531ea7c819e` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `4f2c048f3987462ef1af50f8` | 143AC0000000054 | 3_2 | EXCEPTION | NOT_STARTED |
| `87383e94d148519a8dcc1f21` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `5b05567baefc33d4eff42120` | 143AC0000000054 | 3_2 | EXCEPTION | NOT_STARTED |
| `fbe70c6ed43ae222bf9b82f9` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `2eca64e332ce265fffb2cb54` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `0d7ebca456e5198702c25d58` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `b8d805b89cb00bf0021720e9` | 143AC0000000054 | 3_2 | REFERENCE | NOT_STARTED |
| `632b231bc80bf653e85f8b3f` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `a6c93eca96af81f338857c05` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `eedcbbbdba889a7d5d37ed05` | 143AC0000000054 | 3_2 | UNRESOLVED_NORM | NOT_STARTED |
| `9228e3fa196cd6105999038b` | 143AC0000000054 | 3_2 | DELEGATION | NOT_STARTED |
| `e9fb11ab55549cbb80fa9742` | 143AC0000000054 | 3_3 | UNRESOLVED_NORM | NOT_STARTED |
