# Canonical normative-core decision (Directive §1 / §4)

Decision record for the de-duplication of the task-queue / completion machinery.

## Decision

`scripts/ci/normative_core.py` is the single canonical core. It owns:

- `make_normative_id` — full SHA-256, length-prefixed canonical identity,
- `decompose_article` / `audit_coverage` — normative units with exact spans,
- `parse_dependencies` — law name + article + enforcement version (a bare
  15-character e-Gov id is an underdetermined weak signal only),
- `load_state` / `save_state` / `merge_state` — durable owner / blockers /
  artifacts / evidence,
- `derive_status` — five-valued evidence-based status,
- `select_tasks` — dependency- and ownership-aware selection.

Adapters: `task_queue.py`, `task_selector.py`, `article_obligations.py`.
`article_scope.py` is deliberately a pure, I/O-free helper (source location,
clause decomposition, H/T/D/C/U findings) and does not import the core.

## What was removed and why

- `scripts/ci/norm_core.py` — a full second "single source of truth" written in
  parallel, with an incompatible API (`make_norm_id`, `AXIS_KEYS`, `Ledger`).
  Only one test used it. Removed.
- `scripts/ci/test_norm_core_regression.py` — tested the removed duplicate.
  Its invariants (full SHA-256 ids, exact coverage, UNRESOLVED recording,
  structured dependencies, evidence-based status, durable merge) are covered
  by `scripts/tests/test_normative_core.py` (20 tests, all passing). Removed.

## Enforcement

`scripts/tests/test_single_canonical_core.py` fails CI if:

1. any second core-named module appears in `scripts/ci/`,
2. any module other than the core defines `make_normative_id` /
   `derive_status` / `merge_state` / `decompose_article` /
   `parse_dependencies`,
3. any of the three I/O adapters stops importing the core.

Measured: 4/4 tests pass on `dedup/normative-core` (PR #187).

## PR consolidation

- PR #185 (`fix/directive1-queue-clean`) — superseded and closed automatically.
- PR #186 (`fix/directive1-queue-completion-20261120`) — merged into main
  (`2eb3e38`); it contained the complete §1 corrected machinery plus the
  independent completion audit.
- PR #187 (`dedup/normative-core`) — this de-duplication and the structural
  sibling-index fix for supplementary provisions (67 distinct provisions had
  collapsed onto one path, causing id collisions).

## Completion claim

None. Machine verification of the full target set remains incomplete:
396,854 normative units, 0 FULLY_VERIFIED, 52 pinned article obligations at
PARTIAL, 3,438 human-review candidates with 0 recorded reviewers.
