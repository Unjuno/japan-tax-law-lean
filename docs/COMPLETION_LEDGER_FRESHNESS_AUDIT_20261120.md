# Completion-gate regression audit (2026-11-20) — measurement, not a completion claim

Base: `origin/main` at `c48b421` (reference commit `44fa08a` retained in history).
`main` was re-fetched repeatedly during this work and advanced through concurrent
merges; at this base the committed queue reports 396,854 units with
NOT_STARTED=396,779, PROVED_SCOPE=1, FULLY_VERIFIED=72, BLOCKED=2. This document
records an independent check of the completion *mechanism*, not a new modeling
claim and not a completion claim.

## H / T / D / C / U

| id | content |
|---|---|
| H (falsifiable) | The completion gate accepts `FULLY_VERIFIED` only when every canonical evidence axis is backed for that exact unit; unbacked or partially backed completions are rejected, and zero completions remain valid. |
| T (reproduction) | Synthetic fixture queue/evidence pairs run through the real gate: `python -m unittest scripts.tests.test_queue_evidence_backing -v`. Real corpus: `python scripts/ci/verify_queue_invariants.py`. |
| D (decision) | 4/4 tests PASS and the real-corpus gate reports 12/12 invariants. Earlier in this work, a base (`e87a0ac`) had stale ledgers (FULLY_VERIFIED=0 despite 47 evidence records); concurrent agents then refreshed them and strengthened the gate to take required axes from `normative_core.EVIDENCE_AXES` instead of from the ledger under test. The remaining local contribution is the independent regression suite recorded here. |
| C (competing interpretation) | One could keep asserting `FULLY_VERIFIED == 0` and delete the evidence ledger. Rejected: that would erase a genuine, attested reduction of 72 unverified obligations and contradict Objective §5. Another competing reading was that axes may be inferred from the evidence file itself; that is circular and has now been rejected on main in favour of the canonical core. |
| U (uncertainty) | A local `lake build` with the pinned Lean 4.35.0 toolchain completed **successfully (524 jobs)** on this corpus. Its first attempt transiently failed on five modules with `failed to read file ... Std/...olean`; all named `.olean` files were verified present and non-zero, and a retry rebuilt those modules cleanly, so this was an I/O artifact of a heavily loaded shared machine, not a proof failure. Human legal review is 0. The gate does not cross-check `status_counts` against the units array; a mismatched count field remains a low-severity open gap. No legal defect is claimed. |

## Measured values

```
python -m unittest scripts.tests.test_queue_evidence_backing -v
  test_backed_completion_is_accepted ... ok
  test_partially_backed_completion_is_rejected ... ok
  test_unbacked_completion_is_rejected ... ok
  test_zero_completions_is_accepted ... ok
  Ran 4 tests ... OK

python scripts/ci/verify_queue_invariants.py
  12/12 invariants passed
  (real corpus: 396,854 units; FULLY_VERIFIED=72, all evidence-backed)

lake build  (Lean 4.35.0, pinned by lean-toolchain)
  Build completed successfully (524 jobs)
python scripts/ci/check_no_sorry.py
  no forbidden placeholder proofs found in tracked Lean sources
axiom probe: 2402 lines; sorryAx hits 0; Classical.choice hits 0
  axiom sets used: [propext] 525 theorems, [propext, Quot.sound] 3 theorems
```

## Changes in this branch

- Added `scripts/tests/test_queue_evidence_backing.py`: four independent
  fixture tests for the evidence-backing invariant.
- Added this H/T/D/C/U record.

No Lean file, proof, statute interpretation, evidence record or generated
ledger was modified by this branch.
