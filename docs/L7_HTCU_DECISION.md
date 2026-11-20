# Per-candidate H/T/D/C/U ledger (Objective §5)

Date: 2026-11-20
Base: `main` @ `0a4b0be` (PR #192 merged)

## Problem

`docs/L7_CANDIDATES_UNREVIEWED.csv` recorded 3,438 detection candidates with
rule id, location, message, evidence and review status, but no per-candidate
H (falsifiable hypothesis), T (reproduction check), D (decision), C (competing
interpretation), U (uncertainty). Objective §5 requires all five on every
detection candidate.

## Change

`scripts/ci/l7_candidates.py` now appends five location-bound columns:

- `hypothesis` — H:<rule> at <law>:<path>:<line> may indicate a defect;
  falsifiable by re-extraction from pinned bytes;
- `reproduction_test` — T: the exact audit command and location;
- `decision` — D: unreviewed candidate, NOT a verified anomaly;
- `competing_interpretation` — C: legitimate bracket/quote/reference usage
  in the original statute can match the pattern;
- `uncertainty` — U: pinned law id, location, line, no reviewer recorded.

The stable `candidate_key` still hashes only the original identity columns,
so existing review overlays are not invalidated. Human review overlays still
override only review_status/reviewer/review_date; H/T/D/C/U are never used
to fabricate a review.

`docs/COVERAGE.md` reports `candidates with H/T/D/C/U complete` as a separate
axis with its own denominator and states that H/T/D/C/U are not legal review.

## Measured results

```
python scripts/ci/l7_candidates.py --write
wrote docs/L7_CANDIDATES_UNREVIEWED.csv (3438 candidate rows, 0 law failure(s))

python scripts/ci/l7_candidates.py
L7 candidates ledger matches committed state (3438 rows; 0 law failure(s))

python -m unittest scripts.tests.test_l7_htcu -v
Ran 3 tests ... OK

python scripts/ci/coverage_ledger.py  (twice)
wrote docs/COVERAGE.md / matches committed state (deterministic)
```

All 3,438 candidates now carry all five axes; 0 human reviews recorded.

## Corrections after independent Codex review of PR #203

1. **Coverage regenerated with real audit inputs** — the first committed
   `docs/COVERAGE.md` was generated before the sweep/cross-law/reference
   artifacts existed, so structural axes showed `n/a`. Re-ran `cross_law.py`,
   `sweep_gate.py` and `collect_references.py` before regenerating; the ledger
   now reports 325 parse-ok / 42,584 articles / 447 pinned modules.
2. **Reproduction record corrected** — `scripts.law_audit.audit` only audits the
   income-tax act/order pair and cannot reproduce candidates from 191 laws.
   `T:` now points to the full-inventory `python scripts/ci/l7_candidates.py`
   sweep with the same family wiring as `collect_rows()`.
3. **Review overlays propagate** — when a valid human review is applied,
   `render()` recomputes D and U so they never say "unreviewed" for a
   `confirmed-anomaly` row. Tests cover both reviewed and unreviewed records.

## H / T / D / C / U for this change

- **H**: if the candidate ledger already satisfied §5, no row would lack an
  H/T/D/C/U column.
- **T**: `python -m unittest scripts.tests.test_l7_htcu -v`.
- **D**: 3,438/3,438 rows have all five axes; H is refuted. This is a
  protocol-record change, not a defect finding.
- **C**: a competing reading is that H/T/D/C/U belong only to high-severity
  findings. §5 says "各検出候補" (each detection candidate), so all candidates
  are covered.
- **U**: H/T/D/C/U values are templated with per-candidate location; they do
  not constitute independent legal analysis. Human review remains pending.

## Non-claims

No defect is asserted; no legal conclusion is drawn. No Lean proof was added,
changed or weakened. Existing human-review overlays remain authoritative.
