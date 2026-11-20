# Patch manifest

All paths are relative to the repository root
`Unjuno/japan-tax-law-lean`. The local patch lives at
`C:\Users\user\Documents\デフォルトプロジェクト\repo_patch\`.

## Modified / replaced

| repo path | purpose |
|---|---|
| `scripts/ci/norm_identity.py` | **new** — norm ids, decomposition, coverage audit, dependency channels, durable overlay, status derivation |
| `scripts/ci/task_queue.py` | replaced — norm-unit queue, persistent state, five-valued status |
| `scripts/ci/task_selector.py` | replaced — dependency/owner/blocker aware selection, persisted assignment |
| `scripts/ci/article_obligations.py` | replaced — per-norm-unit obligations, no false COMPLETE, H/T/D/C/U, SKIP≠PASS |
| `scripts/law_audit/phase_e/article_scope.py` | replaced — exact offsets, coverage audit, unresolved register |
| `scripts/ci/run_python_gates.py` | patched — required gates may not be SKIPped |
| `scripts/tests/test_norm_identity.py` | **new** — 18 unit tests (all passing) |

## New directories / files

| repo path | purpose |
|---|---|
| `state/` | durable overlay (`state/norm_task_state.json` generated at runtime; **must be committed**) |
| `evidence/README.md` | schema for the seven evidence artifacts |
| `docs/TASK_QUEUE_REDESIGN.md` | decision record, measurements, H/T/D/C/U, resume procedure |

## Generated at runtime (commit after regeneration)

- `build/task_queue.json` (git-ignored)
- `state/norm_task_state.json` (**commit**)
- `docs/TASK_QUEUE.md`
- `docs/ARTICLE_OBLIGATIONS.md`
- `docs/ARTICLE_SCOPE.md`

## Validation performed

- Full repository (native Python 3.11.9, latest main `7391a9b7`):
  548,437 norm units, **0 coverage failures**, **0 id collisions**.
- Obligation ledger: 178,949 units under 52 pinned article checks,
  **0 completions**, 178,796 SKIPs recorded separately.
- `python scripts/ci/run_python_gates.py`: **24 gates, 0 skipped, 0 failed**.
- 18/18 norm-identity unit tests; 44 structural-audit tests; 159/159
  transcription checks.
- Selector assigns and persists ownership; scope diagnostic reports exact
  offsets for 126 scoped checks.
- Existing Lean modules untouched; no proof was weakened or removed.
- `lake build` was not run locally (Lean toolchain not installed in this
  session); CI covers the Lean build on push.

## Scope of this commit

This commit changes only the task-queue / completion-criteria tooling and
its generated ledgers. It does not claim legal correctness, does not add new
semantic models, and does not reduce the 324,348 unresolved norm units to
verified status. Human legal review remains pending.
