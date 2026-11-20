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

## Honest status
- This is a **mechanism correctness fix**. It adds no normative model, no Lean
  theorem, and no legal conclusion. It does not by itself reduce the verified
  unit count; it prevents a class of false completion in the selector.
- Branch pushed to `origin/fix/dependency-enforcement-version-1-6`.
- PR creation was attempted but blocked by `GraphQL: API rate limit already
  exceeded for user ID 241447786`. The pushed branch is the resumable artifact.
- Human legal review remains 0 / independent axis (never auto-satisfied).
- Local tax ordinances per municipality, treaties/circulars/case law as a
  separate source layer: out of scope of this change.
