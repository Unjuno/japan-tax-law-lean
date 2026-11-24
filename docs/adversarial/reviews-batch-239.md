# Adversarial review — batch 239

Mechanical (not human) independent re-extraction of six 地方税法 art.34
threshold/tier units. No human legal approval is recorded here.

## Shared pin

law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
raw `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
Needles below were re-extracted from the scoped clauses of Article 第三十四条.

### LocalTax34DisasterExpense50k.lean — 災害関連支出 5万円超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit `NORM|8e267f1635da519fbb9ef316cdf3ec05a4a08d82d2464c196d50b390ca3aa043`.
- Needle 「損失の金額に含まれる災害関連支出の金額が五万円を超える場合」;
  literal 五万 = 50,000, strict lower (50,000 excluded, 50,001 included).
- Independent successor-form spec, universal axiom-free bridge, kernel boundaries.
- H/T/D/C/U: H（災害関連支出5万超）, T（五万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（損失額の算出・他条は非介入）.

### LocalTax34NewLifeInsurance56k.lean — 新生命保険料 5万6千円超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit `NORM|2d64a41b267757d442e7ff002cfb4b17275c4ca8b8aa28d7b85f83eff968bee3`.
- Needle 「前年中に支払つた新生命保険料の金額の合計額が五万六千円を超える場合」;
  literal 五万六千 = 56,000, strict lower.
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（新生命保険料5.6万超）, T（五万六千、bytes pinned）,
  D（普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（控除額の算出・他区分は非介入）.

### LocalTax34OldLifeInsurance70k.lean — 旧生命保険料 7万円超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit `NORM|4ef6cc90eeaf8145a4903f974919bde5ac5e3c5ffe0aab21c7661243c8f5067f`.
- Needle 「前年中に支払つた旧生命保険料の金額の合計額が七万円を超える場合」;
  literal 七万 = 70,000, strict lower.
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（旧生命保険料7万超）, T（七万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（控除額の算出・他区分は非介入）.

### LocalTax34IncomeUpTo9M.lean — 合計所得金額 900万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit `NORM|f956dd02828460c5a2e85d5872758fe30b558869817ddc6ace17082335b151f2`.
- Needle 「当該納税義務者の前年の合計所得金額が九百万円以下である場合」;
  literal 九百万 = 9,000,000, inclusive upper.
- Independent spec `amount <= 9000000`, universal `rfl` bridge, kernel boundaries.
- H/T/D/C/U: H（合計所得900万以下）, T（九百万、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他条は非介入）.

### LocalTax34SpouseBand1M13M.lean — 配偶者 100万円超130万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit `NORM|7117de618d43cf614fa912ffa4678f65aaed65075b573c3fd946b0a99296d4f1`.
- Needle 「前年の合計所得金額が百万円を超え百三十万円以下である配偶者」;
  literals 百万 / 百三十万; interval (1M, 1.3M].
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（配偶者100万超130万以下）, T（両境界、bytes pinned）,
  D（普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（控除の適用・他区分は非介入）.

### LocalTax34SpouseOver13M.lean — 配偶者 130万円超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit `NORM|e8ea306ce417e4feb430f6ef06a3d2c98e7735d0005cd5fdfbc31e47211248e6`.
- Needle 「前年の合計所得金額が百三十万円を超える配偶者」;
  literal 百三十万 = 1,300,000, strict lower.
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（配偶者130万超）, T（百三十万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（控除の適用・他区分は非介入）.

## Status

All six reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
