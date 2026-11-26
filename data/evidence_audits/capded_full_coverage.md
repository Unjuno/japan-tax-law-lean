# FULL-COVERAGE adversarial review — 控除額の上限 (14 units)

Auditor: independent general subagent (session ses_de7651e5fffeSrj24aEcek4hUS).
Read-only, non-sampled audit of all 14 units in `cap_units.json`.
Script: `fullcov_capded_source_fidelity.py`. Not legal advice; not a
completeness claim.

## Verdict: PASS (failures: 0)

| Check | Result |
|---|---|
| SHA-256 pin (unit = task = on-disk = INVENTORY) | 14/14 |
| 「を限度として」 + 「控除」 verbatim in fragment and normalized span | 14/14 |
| Fragment contiguous via `make_full_text_reader(task)` | 14/14 |
| Upper-bound CAP on a deduction (no minimum marker, no rate-as-operation) | 14/14 |
| No 読替え marker in fragment or exact span | 14/14 |
| `MoneyCap*.lean` intact, no forbidden proof tokens | PASS |

Four fragments truncated mid-definition; the deduction verb was verified in
full provision text. Reading-substitution phrases elsewhere in the same
articles were recorded as informational only.

## H/T/D/C/U
- H = 「Xを限度として控除する」 caps the deduction at X: `min(claim, X)`.
- T = full-coverage SHA, verbatim phrase, parsed-text contiguity, upper-bound
  direction inspection, 読替え scan, Lean token/identity scan.
- D = PASS on all axes, 0 failures; `capAmount_agrees` proves the kernel identity.
- C = the claim and limit operands are caller-established; any surrounding
  computation is NOT MODELLED. No legal review performed.
- U = none within the pinned clause; legal validity remains a separate axis.

All 14 units receive `ADVERSARIAL_REVIEW` and `FULLY_VERIFIED` by reuse of the
existing kernel-proved model plus this full-coverage source audit.
