# CI defect — REQUIRED gate referenced a missing test file (2026-11-20)

## H (hypothesis)
On the freshly re-fetched main (`d16d4a8`), `scripts/ci/run_python_gates.py`
declares the gate `task selector computable ranking tests` as REQUIRED and
points it at `scripts/tests/test_task_selector.py`, but that file does not
exist. Per the runner's own rule ("SKIP is never PASS"), the whole suite fails.

## T (test)
Measured `build/gate_results.json` from a full run on the rebased branch:

```
summary {'pass': 31, 'fail': 1, 'skip': 1}
{'name': 'task selector computable ranking tests',
 'verdict': 'SKIP', 'required': True,
 'reason': 'missing scripts/tests/test_task_selector.py'}
1 gate(s) FAILED; 32 ran, 1 skipped (SKIP is never PASS)
```

## D (decision)
Added `scripts/tests/test_task_selector.py` with 8 tests: computable marker
ranking, more-computable-first ordering within a law, deterministic round-robin
interleaving, stable id tie-break, ownership/completion filtering, independent
legal-review axis, unresolved bare-id dependency blocking, and evidence-axis
reporting. `python -m unittest scripts.tests.test_task_selector -v` → **8 tests OK**.

## C (competing interpretation)
One could delete the gate from `REQUIRED_GATES` to make CI green. Rejected:
that would hide the missing verification rather than supply it, directly
contradicting §5 ("registered checks succeeded" and "all obligations complete"
are distinct; a skipped check must never be reported as passed).

## U (uncertainty)
- The added tests exercise the selector policy only; they do not prove that
  the selector's computable-marker heuristic is legally complete.
- Other agents are actively editing the gate runner; this fix is scoped to the
  missing file and does not change the gate declarations.
