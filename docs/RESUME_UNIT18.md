# Resume record: unit 18 (租税特別措置法 art.5 千万円以上八千万円未満)

## Prepared and verified (not merged to main)

- normative_id: `NORM|62f5cc4bbcea65fa1da837bb0ec429829f05651a40f4dcc9f285ce8d904c238a`
- source: `332AC0000000026_20261101_507AC0000000013`, art.5 附則, 施行 2026-11-01
- verbatim: 「千万円以上八千万円未満の金額」; bounded `10,000,000 ≤ amount < 80,000,000`
- branch: `integrate/norm-unit-sm-10m-80m` (head `452ab722a`), PR **#952 OPEN**
- source branch with green Lean job: `feat/norm-unit-sm-10m-80m` commit `3fa2a4dd`
  (CI run `45946914870`, Lean job SUCCESS)
- scoped attestation: `data/PROOF_ATTESTATION_SCOPED_SM10M80M.json`
  (`scope=lean_job_only`, commit `3fa2a4dd`, module hashes verified)
- on the branch: `task_state.json status=FULLY_VERIFIED`, `verification_evidence.json`
  11/11 axes, `verify_queue_invariants.py 17/17`, cross-law 14/14 tests OK and
  `cross_law.py 0 failed`, all regeneration gates rc=0 locally.
- on `origin/main` at measurement time `ebc2a8760`: unit 18 `status=None`,
  evidence absent — **not claimed verified on main**.

## Blocker (measured, not user-dependent)

Branch protection on `main` has `strict: true` with two required contexts
(`Build Lean project and check axioms`, `Semantic audit and mutation injection`).
Verified via `GET /repos/Unjuno/japan-tax-law-lean/branches/main/protection`.

- Head-commit checks on `452ab722a` were both SUCCESS
  (run `45967378377`), but merge was rejected: "2 of 2 required status checks are expected",
  because the `refs/pull/952/merge` commit (`16da8eec9`) had **no check suite**.
- Created `ci-merge-952` at that merge commit and triggered run `45970929736`.
  Lean SUCCESS; semantic audit FAILED with exactly one real gate failure:
  `Coverage ledger regeneration gate ... exit 1` at 2026-11-27T09:33:39Z,
  after `wrote .../docs/COVERAGE.md` at 09:30:33Z — committed `COVERAGE.md` drift
  relative to regenerated content in the merge commit.
- Root cause: concurrent agents regenerate `docs/COVERAGE.md` and other derived
  ledgers on `main` repeatedly while a PR's ~25-minute CI window is open; the
  merge commit therefore contains stale derived files. Repeated conflict
  resolutions (`-X ours` + full regeneration) at commits `455dd88f`, `4b4a528f`,
  `452ab722a` did not resolve the race.

## Resume procedure

1. Re-fetch `origin/main`; create a fresh branch off current main.
2. Copy the seven files listed in the integration commit (`3 Lean modules`,
   transcription pin, two docs, scoped attestation).
3. Regenerate all authoritative ledgers in dependency order
   (`generate_verification_evidence.py`, `task_queue.py`, … ,
   `l7_ledger.py --write`, `coordinator.py --once`, `sweep_gate.py`,
   `cross_law.py`, `coverage_ledger.py`).
4. Confirm locally: 17/17 queue invariants, cross-law 0 failed,
   unit derives `FULLY_VERIFIED` with 11 axes.
5. Push, create PR, and if strict protection again requires checks on the merge
   commit, fetch `refs/pull/<n>/merge`, push it as a branch, trigger
   `gh workflow run lean.yml --ref <that-branch>`, wait for both checks SUCCESS,
   then merge. Retry only if main is stable during the CI window.
6. Do not claim whole-law completion or legal correctness; keep
   `LEGAL_REVIEW_PENDING`.
