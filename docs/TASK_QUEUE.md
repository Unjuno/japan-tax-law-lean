# Persistent task queue (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.

Sponsor Directive §3: every pinned legal provision is a durable work unit.
Human legal review (`LEGAL_REVIEW_PENDING`) is NOT a precondition for
formalization and is tracked as an independent axis (Directive §6).

- laws in inventory: 327
- work units generated: 33652
- units with a pinned literal check: 333
- units NOT_STARTED: 33319

## Status axes (independent — Directive §6)

| axis | values |
|---|---|
| source_fixed / structure_identified | True for all pinned units |
| norm_decomposed | False unless explicitly recorded |
| formalized | NOT_STARTED / COMPLETE_SCOPE / COMPLETE_FULL |
| proved / boundary_checked / independent_audit | False until verified |
| legal_review | LEGAL_REVIEW_PENDING (never auto-satisfied) |

The full machine-readable queue is `build/task_queue.json` (git-ignored,
regenerated from INVENTORY.json + pinned snapshots). The regeneration gate
verifies determinism. Coordinator selects unfinished units from the queue.

## Sample NOT_STARTED units (first 20)

| law_id | article | title | paragraphs | refs |
|---|---|---|---:|---:|
| `143AC0000000054` | 1 | 第一条 | 1 | 0 |
| `143AC0000000054` | 2 | 第二条 | 1 | 0 |
| `143AC0000000054` | 3 | 第三条 | 1 | 0 |
| `143AC0000000054` | 3_2 | 第三条の二 | 2 | 0 |
| `143AC0000000054` | 4_4 | 第四条の四 | 1 | 0 |
| `143AC0000000054` | 4_8 | 第四条の八 | 1 | 0 |
| `143AC0000000054` | 4_9 | 第四条の九 | 1 | 0 |
| `143AC0000000054` | 5 | 第五条 | 1 | 0 |
| `143AC0000000054` | 7 | 第七条 | 33 | 0 |
| `143AC0000000054` | 8 | 第八条 | 37 | 0 |
| `143AC0000000054` | 8_2 | 第八条の二 | 17 | 0 |
| `143AC0000000054` | 9 | 第九条 | 15 | 0 |
| `143AC0000000054` | 9_2 | 第九条の二 | 2 | 0 |
| `143AC0000000054` | 11 | 第十一条 | 1 | 0 |
| `143AC0000000054` | 12 | 第十二条 | 2 | 0 |
| `143AC0000000054` | 13 | 第十三条 | 8 | 0 |
| `143AC0000000054` | 14 | 第十四条 | 1 | 0 |
| `143AC0000000054` | 14_2 | 第十四条の二 | 1 | 0 |
| `143AC0000000054` | 14_3 | 第十四条の三 | 2 | 0 |
| `143AC0000000054` | 15 | 第十五条 | 2 | 0 |
