# Evidence-backed completion gate — reproducible finding and fix (2026-11-20)

Measured, read-only evidence record. No legal defect is claimed; the finding is
about the completion *mechanism*, not about any statute.

## Base

- Re-fetched `main`: `e7b30c9` (merge of PR #190). Reference commit `44fa08a`
  verified in the repository history.
- This branch is stacked on `origin/verify/attestation-evidence-20261120`
  (PR #197), because that branch is the one that introduces
  `data/verification_evidence.json`.

## H / T / D / C / U record

| id | content |
|---|---|
| H (falsifiable hypothesis) | "If a queue unit carries status `FULLY_VERIFIED`, an independent evidence record covering every obligation axis exists for that exact `normative_id`." |
| T (reproduction test) | `python scripts/ci/task_queue.py` followed by `python scripts/ci/verify_queue_invariants.py` on PR #197's head `ae8d557`. Also 5 synthetic fixture tests in `scripts/tests/test_queue_evidence_backing.py`. |
| D (decision) | Before fix: H is **false for the gate implementation** — the gate hard-coded `FULLY_VERIFIED == 0`, so its *own* 47 evidence-backed completions were reported as failures (`11/12 invariants passed`, `FAIL no FULLY_VERIFIED without evidence - FULLY_VERIFIED=47`). After fix: H is checked directly and holds (`12/12`, `every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=47 backed=47/47`). |
| C (competing interpretation) | One could keep `FULLY_VERIFIED == 0` and delete all evidence records. That would satisfy the gate but would erase a genuine, attested reduction of 47 unverified obligations and contradict Objective §5's requirement to keep reducing them. Rejected: the gate must verify backing, not forbid completion. |
| U (uncertainty) | The 47 records attest a GitHub Actions Lean build at commit `0b6e084f…`; the kernel build was not re-run locally (`lake` is unavailable here). Legal review remains `LEGAL_REVIEW_PENDING` (0 completed); this fix does not touch that axis. |

## Changes

1. `scripts/ci/verify_queue_invariants.py`: replaced the constant-zero check with
   an evidence-backing check. A `FULLY_VERIFIED` unit must have an evidence
   record whose own derivation agrees, or non-empty artifact references for all
   eleven obligation axes. The queue's `status_counts` must agree with the
   units actually present. Unbacked, partially backed and count-mismatched
   states all fail; zero completions still passes.
2. `scripts/ci/task_queue.py`: stream to a unique temp file, `fsync`, then
   `os.replace` with a bounded retry. A concurrent reader can no longer observe
   a truncated ~800 MB queue (the prior in-place write caused `JSONDecodeError`
   in `task_selector.py` during concurrent regeneration).
3. `scripts/tests/test_queue_evidence_backing.py`: five regression tests
   (backed accepted; unbacked rejected; partially backed rejected; count
   mismatch rejected; zero completions accepted).

## Measured results

```
# PR #197 head ae8d557, before fix
python scripts/ci/task_queue.py
  normative-unit queue: 396854 units; NOT_STARTED=396805,
  PARTIAL=0, PROVED_SCOPE=0, FULLY_VERIFIED=47, BLOCKED=2
python scripts/ci/verify_queue_invariants.py
  FAIL no FULLY_VERIFIED without evidence - FULLY_VERIFIED=47
  11/12 invariants passed   (exit 1)

# this branch, after fix
python -m unittest scripts.tests.test_queue_evidence_backing -v
  Ran 5 tests ... OK
python scripts/ci/verify_queue_invariants.py
  PASS every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=47 backed=47/47
  12/12 invariants passed   (exit 0)
```

The honest global state is unchanged apart from the mechanism: 396,805 units
remain `NOT_STARTED`, 2 are `BLOCKED`, 47 are evidence-backed, human legal
review is 0, and no claim of full completion is made.
