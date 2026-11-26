# FULL-COVERAGE adversarial review — 控除した残額 (95 units)

Auditor: independent general subagent (session ses_de780843dffeP9GBlEzXp9CIOp).
Read-only, non-sampled audit of all 95 units in `residual_final.json`.
Script: `fullcov_residual_source_fidelity.py`. Not legal advice; not a
completeness claim.

## Verdict: PASS (failures: 0)

| Check | Pass |
|---|---|
| INVENTORY pin SHA == unit SHA == task SHA == on-disk bytes | 95/95 |
| 「AからBを控除した残額」 verbatim in fragment and normalized full text | 95/95 |
| Fragment contiguous via `make_full_text_reader(task)` | 95/95 |
| Direction A − B (not B − A) | 95/95, 0 reversals |
| No 読替え marker inside any norm_fragment | 95/95 |
| Existing `UnusedDeduction*.lean` family intact, no forbidden tokens | PASS |

Scope note: 105 further 「控除した残額」 units were **excluded** because their
fragments are orphan table cells without explicit operands
(`residual_noncontig.json`); no claim is made for them. Two included units have
読み替え in surrounding text (67 and 43 characters after the clause) governing
other provisions; recorded as warnings, not failures. No unit implies a
negative residual, so Nat clamping at zero is not contradicted.

## H/T/D/C/U
- H = 「AからBを控除した残額」 denotes `max(0, A − B)`.
- T = full-coverage SHA, verbatim construction with anchored A/B, parsed-text
  contiguity, direction inspection, 読替え scan, Lean token/identity scan.
- D = PASS on every axis, 0 failures; kernel identity `max(0,A−B)` already
  proved by `undeducted_agrees`.
- C = the statutory operands are identified with A/B by caller; surrounding
  multiplication/rounding and carry-forward rules are NOT MODELLED. No legal
  review has occurred.
- U = none within the pinned clause; legal validity remains a separate axis.

All 95 units receive `ADVERSARIAL_REVIEW` and `FULLY_VERIFIED` by reuse of the
existing kernel-proved model plus this full-coverage source audit.
