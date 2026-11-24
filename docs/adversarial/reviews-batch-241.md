# Adversarial review — batch 241

Mechanical (not human) independent re-extraction of six 地方税法 art.34
threshold units. No human legal approval is recorded here.

## Shared pin

law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
raw SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
Needles are re-extracted from scoped clauses of Article 第三十四条.

### LocalTax34OldLife15k40k.lean — 旧生命保険料 1.5万〜4万

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Unit `NORM|358241fbdf9cba4c14a5567eeb940a3b77447ed82fd302f5a6b221ce581fc929`.
- Needle contains 一万五千 / 四万; interval (15,000, 40,000].
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（1.5万超4万以下）, T（両境界、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（控除算出・他区分は非介入）.

### LocalTax34Income950M1000M.lean — 合計所得 950万〜1000万

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Unit `NORM|3db09a5f8547e9bd59b725662975561d9731a3032ce2ef7f3c17689b632e03c4`.
- Needle contains 九百五十万 / 千万; interval (9,500,000, 10,000,000].
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（950万超1000万以下）, T（両境界、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他条は非介入）.

### LocalTax34SpouseUpTo1M.lean — 配偶者 100万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Unit `NORM|7c6e6e5da92b15fbfb3ba6700fd42b24e73bbfc5ad8c234fa9e5e6d4011ab731`.
- Needle 「前年の合計所得金額が百万円以下である配偶者」; 百万 = 1,000,000 inclusive.
- Independent spec `amount <= 1000000`, universal rfl bridge, kernel boundaries.
- H/T/D/C/U: H（配偶者100万以下）, T（百万、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（控除適用・他区分は非介入）.

### LocalTax34Age16Plus.lean — 年齢十六歳以上（境界修正）

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Unit `NORM|27e5502e8b621ca04953dba0a121d0629a5816344f55d4b6c2390934c8072651`.
- Needle 「年齢十六歳以上の者」; 以上 is INCLUSIVE: 16 qualifies, 15 does not.
- The initial model used strict `>` (a shared-misunderstanding risk); the source
  needle and kernel boundary check refuted it. Corrected to `16 ≤ a` with an
  independent spec and rfl bridge; `inScopeBool` also corrected.
- H/T/D/C/U: H（16歳以上）, T（十六、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（その他要件・他条は非介入）.

### LocalTax34IncomeUpTo24M.lean — 合計所得 2400万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Unit `NORM|5e4872d35b2a0abab15642ee73a30f320140bdea2c5c97f7653656d69b31fe9d`.
- Needle contains 二千四百万; inclusive upper 24,000,000.
- Independent spec `amount <= 24000000`, universal rfl bridge, boundaries.
- H/T/D/C/U: H（合計所得2400万以下）, T（二千四百万、bytes pinned）,
  D（rfl/decide）, C（needle scoped, 境界完整, spec 独立）, U（税率・他条は非介入）.

### LocalTax34RelativeOver1_2M.lean — 特定親族 120万円超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Unit `NORM|57cd4b744e4fc3c25bc2762d40aaf803b14eb4e694033819ccd5880a5a204d63`.
- Needle contains 百二十万; strict lower 1,200,000.
- Independent successor-form spec, universal bridge, kernel boundaries.
- H/T/D/C/U: H（特定親族120万超）, T（百二十万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（控除適用・他区分は非介入）.

## Status

All six reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
