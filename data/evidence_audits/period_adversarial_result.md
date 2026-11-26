# FULL-COVERAGE adversarial review — PeriodAllocation (21 units)

Auditor: independent general subagent (session ses_de78ec181ffenYOcwYJZs76qul).
Read-only, non-sampled audit of all 21 units in `period_units.json`.
Scripts: `fullcov_period_source_fidelity.py` (auditor) and `verify_contig2.py`
(confirmation using `make_full_text_reader`).
Not legal advice; not a completeness claim.

## Verdict: PASS (failures: 0)

| Check | Result |
|---|---|
| Pinned SHA-256 (INVENTORY = unit = task_queue = raw bytes) | 21/21 |
| 「で除して得た」 verbatim in normalized source and fragment | 21/21 |
| Divisor is a COUNT (年数/月数/納期の数/回数/総数/総口数), not a rate | 21/21, 0 rate flags |
| Full-fragment contiguity via `make_full_text_reader` | 21/21 |
| Clause-level contiguity (maximal span) | 21/21 |
| Distinct IDs / forbidden proof tokens | 21/21 distinct / 0 |
| Relational spec independent of `Nat.div` | confirmed; `perUnit_satisfies` + `perUnit_unique` require `0 < count` |
| 読替え units (`b4b6a44f7834`, `018d3038ad9d`) | correctly excluded |

Two units with とあるのは were excluded before recording: their norm is a
text-replacement instruction, not an amount-division rule.

## Correction to my initial mechanical audit
My first check reported contiguity 15/21 because it matched fragments against
the **raw JSON file text** (structural escaping/punctuation between leaf
strings) instead of the parsed provision text. Re-running with the repository's
`make_full_text_reader` gives **21/21**; the independent auditor independently
reproduced this. The earlier 15/21 is a method defect, not a source defect.
`period_audit.json` is corrected accordingly.

## H/T/D/C/U
- H = 「額を（期間数）で除して得た額」 is the integer quotient `amount / count`.
- T = full-coverage SHA, verbatim phrase, divisor classification, parsed-text
  contiguity, clause contiguity, comment-stripped Lean token scan, spec check.
- D = PASS on all axes; 0 failures, 0 rate divisors, 0 forbidden markers.
- C = the count must be positive; `count = 0` has no legal meaning and the model
  returning 0 there is a Lean convention, not a statutory rule. `amount`, the
  count, surrounding multiplication and rounding are caller-established.
- U = no legal review. No completeness claim.

All 21 units receive `ADVERSARIAL_REVIEW` and `FULLY_VERIFIED`.
