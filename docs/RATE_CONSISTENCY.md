# Cross-article / cross-law rate consistency (machine-generated)

Do not hand-edit. Regenerate with `scripts/law_audit/phase_e/rate_consistency.py`.

Objective §5: verify definitional/rate consistency between articles and laws.
Each source is checked independently against (a) pinned raw text (verbatim
needle, whitespace-normalised) and (b) the cited Lean TaxRate constant.
A divergence is a CANDIDATE INCONSISTENCY requiring independent legal review;
it is NOT auto-classified as a confirmed defect. Agreement is only under the
stated pinned revisions and does not establish legal equivalence.

## 利子等 源泉徴収税率 15%

| law_id | article | Lean def | expected | pinned needle | Lean model |
|---|---|---|---|---|---|
| `340AC0000000033` | 第百八十二条 | IncomeMiscDeductions.lean::interestWithholdingRate | 15/100 | FOUND | OK |
| `340AC0000000033` | 第百七十五条 | IncomeWithholdingRates.lean::annuityWithholdingRate | 15/100 | FOUND | OK |

Result: CONSISTENT under pinned revisions

## 配当等 源泉徴収税率 20%

| law_id | article | Lean def | expected | pinned needle | Lean model |
|---|---|---|---|---|---|
| `340AC0000000033` | 第百八十二条 | IncomeMiscDeductions.lean::dividendWithholdingRate | 20/100 | FOUND | OK |
| `340AC0000000033` | 第百七十五条 | IncomeWithholdingRates.lean::dividendWithholdingRate | 20/100 | FOUND | OK |

Result: CONSISTENT under pinned revisions

## Intentional special-rate overrides (BY-DESIGN, not contradictions)

Objective §5 requires that intended 特例 / 優先関係 not be mistaken for a
contradiction. An override is recognised only when the pinned special-law
text contains an express override phrase (e.g. 「…の規定にかかわらず」).

### 特定の医療法人の法人税率の特例 (租税特別措置法 art.67の2(1) → 法人税法 art.66(1))

| check | result |
|---|---|
| base article + rate | FOUND |
| special article + rate | FOUND |
| express override phrase | FOUND |
| base Lean rate CorporateTaxRate.lean::ordinaryRate = 232/1000 | OK |
| special Lean def PhaseECorpRates.lean::specialMedicalCorpTax references `smeRate` = 19/100 | OK |

Classification: BY-DESIGN — express statutory override of the base rate

## Totals

- semantic keys checked: 2
- source articles checked: 4
- pinned needles FOUND: 4/4
- Lean rate constants matching expected: 4/4
- candidate inconsistencies: 0
- intentional overrides verified BY-DESIGN: 1/1

candidate inconsistencies are NOT confirmed defects: they require the same
independent human legal review tracked in docs/BLOCKED.md.
