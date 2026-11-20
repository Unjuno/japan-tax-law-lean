# Session evidence — dependency enforcement version (2026-11-20)

## Base refresh (measured)
- `git fetch origin main` run repeatedly this session.
- Base at first task: `e7b30c9` (merge of PR #190).
- After rebase: `origin/main` advanced to `d16d4a8`
  (`feat(evidence): recognise module-specific independent reviews across batches (#210)`).
  My branch `fix/dependency-enforcement-version-1-6` is rebased onto it.
- Reference commit `44fa08a` still present in history.

## First execution task (verified, not re-implemented)
`python scripts/ci/run_python_gates.py` on a clean worktree of the freshly fetched
main: **27 gates ran, 0 SKIP, 0 FAIL**, including the four target artifacts
`normative_core.py`, `task_queue.py`, `task_selector.py`, `article_obligations.py`
and `article_scope.py`. `verify_queue_invariants.py`: **12/12 PASS**.
This was prior merged work (PRs #186/#187/#190); I verified it rather than rewriting it.

## Contribution this session — §1.6 false-readiness defect
- Reproduction (`_repro_dep.py`, locked in as regression test):
  - BEFORE: `readiness = {'uB': True, 'uA-future': True, 'uA-correct': True}`
    although `uA-future` depends on `B@2027-01-01`, which is **not verified**.
  - AFTER: `readiness = {'uB': True, 'uA-future': False, 'uA-correct': True}`.
- `python -m unittest scripts.tests.test_normative_core
  scripts.tests.test_completion_gate_adversary -v` → **32 tests OK** (4 new).
- `python scripts/ci/verify_queue_invariants.py` → **12/12 PASS**, including
  `PASS every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=72 axes=11 unbacked=0`.
- Queue after regeneration: `396854 units; NOT_STARTED=396779, PROVED_SCOPE=1,
  FULLY_VERIFIED=72, BLOCKED=2` (exact counts from the regenerated
  `build/task_queue.json`; the 72 verified units come from the already-merged
  attestation work on main, not from this change).
- Lean kernel build (Lean 4.35.0, installed locally in WSL this session):
  `lake build` → **Build completed successfully (524 jobs)**.
- H/T/D/C/U record: `docs/DEPENDENCY_VERSION_ADVERSARIAL_20261120.md`.

## Second defect found on latest main — missing REQUIRED test file
The freshly re-fetched main (`d16d4a8`) declares a REQUIRED gate
`task selector computable ranking tests` whose test file was absent, so the
full gate suite failed with `SKIP is never PASS`
(`build/gate_results.json`: 31 pass / 1 fail / 1 skip). Added
`scripts/tests/test_task_selector.py`; an independent agent added the same file
on main, and the rebase conflict was resolved by merging both test sets
(**11 tests, all OK**). H/T/D/C/U record:
`docs/CI_REQUIRED_GATE_MISSING_TEST_20261120.md`.

## Honest status
- Both contributions are **mechanism correctness fixes**. They add no normative
  model, no Lean theorem, and no legal conclusion. They do not by themselves
  change the verified-unit count; they prevent false completion and a false
  green CI.
- Branch: `fix/dependency-enforcement-version-1-6`; **PR #219** opened against
  main (`https://github.com/Unjuno/japan-tax-law-lean/pull/219`), state OPEN.
  CI jobs (`Build Lean project and check axioms`, `Semantic audit and mutation
  injection`) were pending at last observation.
- PR creation was initially blocked by GitHub GraphQL rate limiting; it was
  retried successfully after the limit cleared.
- Human legal review remains 0 / independent axis (never auto-satisfied).
- Local tax ordinances per municipality, treaties/circulars/case law as a
  separate source layer: out of scope of this change.
