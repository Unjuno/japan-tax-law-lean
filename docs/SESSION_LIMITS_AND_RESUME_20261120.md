# Session limits and resume procedure (2026-11-20)

## Measured state (controlled consolidated checkout of PR #211, head 707bd9c)

- 327 laws; 396,854 normative units.
- Statuses: NOT_STARTED 396,779 | PARTIAL 0 | PROVED_SCOPE 1 | FULLY_VERIFIED 72 | BLOCKED 2.
- 52 pinned article checks: 0 FULLY_VERIFIED (evidenced scope only); human legal review 0.
- Evidence ledger committed to PR #211: 73 entries (72 FULLY_VERIFIED, 1 PROVED_SCOPE).
- art. 21-5 is capped at PROVED_SCOPE by `NEEDLE_REUSED_IN_21_11_2` (independent finding).
- Independent source review: 160 check rows, 47 PASS.
- Adversarial completion-gate audit: PASS (0 MUST failures); QA audit 8/8.
- PR #188: both CI checks PASS. PR #192, PR #211: open.

## What is proven

- Lean kernel: PR #188 `Build Lean project and check axioms` PASS in CI; no
  sorry/admit/axiom in the added unit.
- 114+ Python tests pass across the suites; `test_queue_invariants` 4/4 OK
  (12/12 invariants in each direction), `test_task_selector` 5/5 OK.
- Completion is evidence-derived: no bare COMPLETE, SKIP is not PASS in strict mode.

## Blockers (environment, not repository defects)

- Many concurrent agents rewrite the shared working tree and `verification_evidence.json`,
  causing the live count to oscillate (8 <-> 72). Only the isolated PR #211 checkout
  is stable at 72.
- `lake`/Python gates are IO-bound: mutation-injection tests took 1120 s; strict gate
  suite was SIGTERM'd at 1800 s before its final SUMMARY. No global PASS is claimed.
- Several sweeps hit MemoryError (7 laws) under concurrent load; recorded as unsupported.
- GitHub API rate limits intermittently block `gh pr checks` / log retrieval.

## Resume procedure

1. Use an isolated checkout of `qa/independent-source-review-20261120` (PR #211);
   do not measure in the shared working tree.
2. Run `python scripts/ci/independent_source_review.py`,
   `python scripts/ci/generate_verification_evidence.py`,
   `python scripts/ci/task_queue.py` in that order; expect 72 FULLY_VERIFIED.
3. Run `python scripts/ci/run_python_gates.py --strict` with >= 3600 s allowance
   and low concurrent load; require a final SUMMARY line before claiming global PASS.
4. Continue selecting NOT_STARTED units with `scripts/ci/task_selector.py`; for each
   new unit require an independent spec, kernel-checked build, boundary tests, an
   independent source re-extraction record and honest unhandled conditions.
5. Keep LEGAL_REVIEW_PENDING. Do not declare completion until all 396,854 units
   are decomposed, formalized, proved and source-audited.
