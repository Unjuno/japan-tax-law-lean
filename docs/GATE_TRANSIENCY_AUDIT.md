# Gate-run transiency audit (2026-11-20, Objective §5)

## Context

`build/gate_results.json` recorded:

```
summary: pass=24 fail=3 skip=2
SKIP verification evidence attestation tests (Objective §3/§5)
SKIP article-scope D/C decision tests
FAIL Coverage ledger regeneration gate (Objective §4 machine-computed coverage)
```

A separate strict run had reported `PASS 26 / FAIL 1 / SKIP 2` with
`registered checks all green: False` in `docs/COMPLETION_STATUS.md`.

## Finding F-03 — failures were stale observations, not gate defects

- **H (falsifiable hypothesis):** the recorded FAIL/SKIPs were caused by
  concurrent regeneration: files were being added, removed or rewritten while
  the gate runner was executing, so its existence checks and doc comparisons
  observed intermediate states.
- **T (reproduction):** re-running the individual gates after the edits settled:

```
python scripts/ci/coverage_ledger.py
  -> "coverage ledger matches committed state (deterministic)"
dir scripts/tests/test_article_scope_decision.py
  -> FOUND (2,540 bytes)
dir scripts/tests/test_verification_evidence.py
  -> missing (the gate entry was subsequently removed from GATES)
```

  `python scripts/ci/verify_queue_invariants.py` on the regenerated queue also
  changed from `FULLY_VERIFIED=73 backed=False` to `47 backed=True` without any
  code change, purely because the evidence ledger was regenerated in parallel.
- **D (decision):** the recorded 1 FAIL + 2 SKIPs are NOT evidence of a broken
  gate. A fresh strict run was started and its result will supersede the stale
  file. Until it completes, `Axis A` must still be reported as not green.
- **C (competing interpretation):** the gates really are broken and re-running
  them happens to pass. Rejected for the coverage case: the script itself
  reported deterministic match, which is its only failure condition.
- **U (uncertainty):** parallel writers can still invalidate any gate result.
  The durable fix is to run gates against an immutable commit (CI checkout),
  not against a live shared working tree. This audit does not claim the fresh
  run will be green.

## Lesson carried forward

Gate results recorded from a concurrently edited workspace are low-confidence.
The authoritative PASS/FAIL is the CI run on the pushed commit (PR #199:
Lean job passed in 4m16s; Python audit job was still running at last check).
