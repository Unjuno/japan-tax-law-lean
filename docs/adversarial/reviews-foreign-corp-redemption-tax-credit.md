### ForeignCorpRedemptionTaxCredit.lean — adversarial review (NORM|d0d5fcd2…)

独立再抽出: the clause was re-extracted from the pinned raw snapshot (一次資料) and
compared against the model header and the article-scoped transcription pin.
判定: the model covers ratio application to both the income tax and the period gain,
the limit-rate deduction, and saturating subtraction; ratio/rate derivation is NOT MODELLED.
H/T/D/C/U record below.

Pinned: law `362CO0000000335`, article 第三条, revision pinned via `build/coordinator_assignments.json`.

| id | H (falsifiable hypothesis) | T (reproduction test) | D (verdict) | C (competing reading) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | Ratio applied only to income tax, not the period gain | `credit 100 100 1 2 20 = 40` (both halved: 50-10) | PASS — both applications present | — | none |
| H2 | Limit-rate deducted from the unprorated amount | `credit 100 100 1 2 20 = 40` vs `80` at full ratio | PASS — limit applies to prorated period gain | — | none |
| H3 | Zero denominator produces unsound division | `credit 100 100 1 0 20 = 0` | PASS — guarded branch | — | none |
| H4 | Negative residual represented incorrectly | `credit` uses Nat saturating subtraction | PASS —税额 cannot be negative | — | none |
| H5 | Spec circular | `specApply` uses `num * amount`; `spec_agrees` proved by `Nat.mul_comm` and a denominator case split, no axioms | PASS | — | none |
| H6 | Finite examples mistaken for universal | `spec_agrees` universally quantifies all five inputs | PASS | — | none |
| H7 | Ratio/rate derivation silently dropped | Header and scope note record NOT MODELLED; values are inputs | PARTIAL_BY_SCOPE | A stricter reading would require deriving the holding-period ratio | Ratio inputs are outside this clause |

Conclusion: implementation and independent spec agree for all inputs; no `sorry`/`admit`,
no unexplained axioms, no legal determination. Human legal review stays pending.
