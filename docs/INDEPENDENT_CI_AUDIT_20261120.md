# Independent CI audit — 2026-11-20 (measurement, not a completion claim)

This file records an **independent verification pass** over the working tree.
It is deliberately separate from the generated ledgers and from any single
agent's patch, so that the measurement remains available while the queue /
completion tooling is being changed concurrently.

## Baseline

- Repository: `Unjuno/japan-tax-law-lean`
- Local HEAD: `22246889a2d91e927cadb2c6382a9911904325e3`
- HEAD subject: `docs: cycle-21 adversarial review (Batch AG) + ledger refresh`
- GitHub `main` head checked via `https://github.com/Unjuno/japan-tax-law-lean/commits/main`:
  `2224688...` — local checkout matches the latest remote main.
- Reference commit from the directive: `44fa08a` (older than HEAD; retained as a
  reference point, not used as the base).

## Command executed

```
python scripts/ci/run_python_gates.py
```

(exit code **1** at the time of measurement).

## Measured gate outcome

Registered checks that **passed**:

- structural audit tests (44 tests)
- mutation injection tests (12 tests)
- inventory selection tests (7 tests)
- cross-law consistency tests (14 tests)
- revision impact tests (8 tests)
- Phase A inventory integrity: 327 records, 325 resolved, 325 raw snapshots
  hash-verified, 2 unresolved (recorded, not counted as verified)
- Phase E cross-law pin consistency: 517 Lean files scanned, 446 pinned modules
  consistent, 0 failed, 71 unpinned (not counted as verified)
- Phase F revision impact: 325 pinned revisions, 0 problems, 189 distinct
  amendment laws (186 outside the tax ledger, recorded, not judged)
- Phase B full sweep: 325 parse OK / 0 parse failure / 0 audit failure,
  42,584 articles, 476,500 references, 0 verified anomalies,
  3,438 **candidate** findings (unreviewed, not defects)
- recursive discovery, law status, rate consistency, BLOCKED, coverage, L7,
  L7-candidates ledgers: all deterministic
- L1 transcription audit: **158/158** checks passed (transcription fidelity
  only — explicitly not a semantics or legal-correctness audit)
- audit + report regeneration: PASS

Registered checks that **FAILED** (5):

| gate | observed cause |
|---|---|
| normative identity / completion tests | `test_bare_15digit_is_underdetermined`: expected `resolution == "unresolved_underdetermined"`, not produced by the current dependency parser |
| Article verification obligations gate | `AttributeError: module 'normative_core' has no attribute 'INVENTORY'` |
| Persistent task queue regeneration | `AttributeError: module 'normative_core' has no attribute 'INVENTORY'` |
| Task selector smoke test | `KeyError: 'normative_id'` — selector and queue projection use different key names |
| Article-scoped fidelity diagnostic | `AttributeError: module 'normative_core' has no attribute 'INVENTORY'` |

Registered check **SKIPPED** (1), and therefore **not counted as PASS**:

- Completion gate: `missing ['scripts/ci/completion_gate.py', 'docs/COMPLETION_STATUS.md']`

## Authoritative remote CI for this exact HEAD

Checked `https://github.com/Unjuno/japan-tax-law-lean/commit/22246889a2d91e927cadb2c6382a9911904325e3/checks`:

- Workflow `Lean & Audit verification`, event `push`, run **#420** — overall
  status **failed** (6m 26s).
- Job **"Build Lean project and check axioms"** — **succeeded** in 3m 1s.
  The Lean kernel build and axiom checks for this commit are therefore green.
- The other job, "Semantic audit and mutation injection", is the failing side
  of the workflow, consistent with the local Python gate failures above.
- The immediately preceding main commit `c47a7e9` (merge of PR #183) had the
  same workflow **completed successfully** (run #419).

Conclusion: the regression is in the Python audit/queue layer, **not** in the
proved Lean corpus. No existing proof needs to be discarded or weakened.

## Measured queue state after the integration fix

After adding the missing shared path constant (`INVENTORY`) to
`scripts/ci/normative_core.py`, the four previously crashing tools ran:

```
python scripts/ci/article_obligations.py
  -> article obligations: NOT_STARTED=52, PARTIAL=0, PROVED_SCOPE=0,
     FULLY_VERIFIED=0, BLOCKED=0

python scripts/ci/task_queue.py
  -> normative-unit queue: 396854 units; NOT_STARTED=396852,
     PARTIAL=0, PROVED_SCOPE=0, FULLY_VERIFIED=0, BLOCKED=2

python scripts/law_audit/phase_e/article_scope.py
  -> article-scope diagnostic: 158 scoped / 0 whole-text across 158 checks

python scripts/ci/task_selector.py 3
  -> queue_units=396854, selectable=396852, skipped_owner=0,
     skipped_dependency_or_blocker=7, 3 units selected
```

Independent inspection of `build/task_queue.json` (396,854 units):

| measurement | value |
|---|---:|
| NOT_STARTED | 396,852 |
| PARTIAL / PROVED_SCOPE / FULLY_VERIFIED | 0 / 0 / 0 |
| BLOCKED | 2 |
| units with dependencies | 142,581 |
| units with unhandled conditions | 180,617 |
| units with a verification evidence reference | **0** |
| norm kind `UNRESOLVED` | 180,617 (45.5%) |
| scope `FULL_ARTICLE` / `COMPUTABLE_SLICE_ONLY` | 216,235 / 180,617 |

`scripts/ci/completion_gate.py` emits the two independent axes and the verdict
`all-complete claimable: False`; `docs/COMPLETION_STATUS.md` is deterministic on
re-run. `python scripts/ci/check_no_sorry.py` reports no forbidden placeholder
proofs in tracked Lean sources.

These numbers are a **baseline of unverified obligations**, not evidence of
progress: zero units currently have recorded verification evidence, so no
formalization progress can be credited from the new models alone.

## Interpretation

The five FAILs are **integration failures between concurrently edited modules**,
not failures of the previously proved Lean corpus. The existing Lean proofs
and the pinned-source audit remain green (see the passing gates above). No
`verified-anomaly` was produced and no law was declared defective.

A SKIP is not a PASS. The missing completion gate means the repository cannot
currently emit the machine-readable `COMPLETE / INCOMPLETE` verdict required by
Directive §5; that capability remains an **unfinished obligation**.

## Concurrency observation

During this pass the files under `scripts/ci/` had modification timestamps
advancing minute by minute from another writer in the same workspace (e.g.
`normative_core.py` 14:39:03, `task_queue.py` 14:38:57, `task_selector.py`
14:35:48). A test module that existed at the start of the pass
(`scripts/tests/test_normative_identity.py`) was absent on the immediate
re-check. The failures above are therefore a **snapshot**, not a guarantee of
the current tree. This is why the measurement is frozen in this file rather
than folded into a generated ledger.

## Reproduction

```
git -C <repo> rev-parse HEAD
python scripts/ci/run_python_gates.py
python -m unittest discover -s scripts/tests -v
```

A reviewer should re-run these after the concurrent edits settle. A claim that
the queue/completion refactor is complete is only supported if all five FAIL
gates above pass **and** the completion gate emits an explicit verdict.

## What this audit does not claim

- It does not claim any Japanese tax law is defective.
- It does not claim Lean kernel verification of any new model added during the
  refactor; `lake build` was not run in this pass.
- It does not claim human legal review. All such obligations remain pending.
