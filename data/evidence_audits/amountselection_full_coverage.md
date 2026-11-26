# FULL-COVERAGE adversarial review — いずれか多い／少ない金額 (81 units)

Auditor: independent general subagent (session ses_de749cfedffe73A8OHFJFtojJy).
Read-only, non-sampled audit of all 81 units in `select_units.json`.
Script: `fullcov_amountselection_source_fidelity.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (failures: 0)

| Check | Result |
|---|---|
| SHA-256 pin (unit = task = on-disk = INVENTORY) | 81/81 |
| 「いずれか多い/少ない/高い/低い/大きい」 verbatim, op matches token | 81/81 (34 max, 47 min) |
| Fragment contiguous via `make_full_text_reader(task)` | 81/81 |
| Direction larger/smaller selection | 81/81, 0 reversals |
| No 読替え marker in fragment | 81/81 |
| Lean family intact; independent if-comparison + lattice specs | PASS |

20 exceptions were flagged for review: 12 direct cap/threshold uses
(e.g. 「いずれか低い額を限度として」) and 8 nearby rounding/date or
cross-referenced comparisons outside the pinned span. None reverses the
larger/smaller selection; the selected amount is subsequently used as a cap
or compared, which is caller-established and NOT MODELLED.

## H/T/D/C/U
- H = 「AとBのいずれか多い/少ない金額」 is `max(A,B)` / `min(A,B)`.
- T = full-coverage SHA, verbatim token, parsed-text contiguity, direction
  inspection, 読替え scan, Lean token/spec independence scan.
- D = PASS on all axes, 0 failures; `greater_agrees`/`lesser_agrees` and the
  least-upper/greatest-lower-bound theorems are kernel-proved.
- C = the compared amounts are caller-established; downstream caps, rates and
  rounding are NOT MODELLED. No legal review.
- U = none within the pinned selection clause; legal validity is a separate axis.

All 81 units receive `ADVERSARIAL_REVIEW` and `FULLY_VERIFIED`.
