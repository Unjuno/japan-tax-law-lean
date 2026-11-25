# Adversarial review — batch 243

Mechanical (not human) independent re-extraction of four EXCEPTION units with
period/amount ceilings. No human legal approval is recorded here.

### RegTax41_19_3IndividualIncomeOver10M.lean — 個人の合計所得 1000万円超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`.
- Unit `NORM|c12f3953d4c85be4be5034ac1d384aea93cfb6c5d70eb855904518551f6d0429`.
- Needle 「ただし、当該個人の…合計所得金額が千万円を超える場合には…」;
  千万 = 10,000,000 strict trigger; 10M does not trigger, 10,000,001 does.
- Independent successor-form spec, universal bridge, kernel boundaries.
- Note: a previously drafted 1-year ceiling unit was withdrawn before
  attestation because a statutory literal of 1 registers only two boundary
  categories (`spec_literals` treats 1 as structural); it was replaced by this
  substantive 10M trigger rather than weakening the boundary gate.
- H/T/D/C/U: H（個人の合計所得1000万超）, T（千万、bytes pinned）,
  D（普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（例外の効果・本則は非介入）.

### Customs123PeriodCeiling60Days.lean — 求める期間 60日を超えない

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `329AC0000000061`, revision `329AC0000000061_20261101_507AC0000000064`,
  raw snapshot pinned in the source layer.
- Unit `NORM|ad89049f53b3ed5b486cc696d95a0200fe3a28ae8859d195de653f60468c2e40`.
- Needle 「…通じて六十日を超えることができない。」; 六十 = 60 days inclusive.
- Independent spec `amount <= 60`, universal rfl bridge, kernel boundaries.
- H/T/D/C/U: H（期間60日以下）, T（六十、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（消去手続・他条は非介入）.

### LocalTax15PeriodCeiling2Years.lean — 猶予期間 通算2年を超えない

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin as the first section.
- Unit `NORM|a645e7a0ce1b01d38a43e33963dc35966971411db018d81d64ed0d099332ad2b`.
- Needle 「…合わせて二年を超えることができない。」; 二 = 2 years inclusive.
- The "合わせて" aggregation of prior periods is NOT MODELLED; only the ceiling.
- Independent spec `amount <= 2`, universal rfl bridge, kernel boundaries.
- H/T/D/C/U: H（通算猶予期間2年以下）, T（二、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（通算の方法・他条は非介入）.

### RegTax41_19_3IncomeOver10M.lean — 合計所得 1000万円超の例外

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`.
- Unit `NORM|dc2ead3a9d4f57a50d2844f6ad20e035611cec7516ecd760a5b00ba0c3234272`.
- Needle 「…合計所得金額が千万円を超える場合には、この限りでない。」;
  千万 = 10,000,000 strict trigger; 10M does not trigger, 10,000,001 does.
- The exception's legal effect ("この限りでない") and the base rule are NOT
  MODELLED; only the quantitative trigger interval.
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（合計所得1000万超）, T（千万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（例外の法的効果・本則は非介入）.

## Status

All four reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
