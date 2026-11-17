import JapanTaxLaw.SpecialMeasuresCasinoRatio

/-!
# SpecialMeasuresCasinoRatioTests — 租税特別措置法施行令 第四十六条の四 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

「合計額」= `totalConsideration + casinoIncome` であること、および境界
（ちょうど 5% → true／5% 超 → false）を確認する。

NOT MODELLED: 金額の認定・課税期間の特定・その他の政令要件（すべて caller-established、
impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.SpecialMeasuresCasino

open JapanTaxLaw.TaxFinance

-- 「合計額」= totalConsideration + casinoIncome
example : casinoCombinedTotal 0 0 = 0 := by decide
example : casinoCombinedTotal 95 5 = 100 := by decide
example : casinoCombinedTotal 9_500_000 500_000 = 10_000_000 := by decide

-- 境界: ちょうど 5% → true（適用）
example : casinoRatioWithin5pct 95 5 = true := by decide
example : casinoRatioWithin5pct 285 15 = true := by decide
example : casinoRatioWithin5pct 9_500_000 500_000 = true := by decide
-- 境界: 5% 超 → false（非適用）
example : casinoRatioWithin5pct 94 6 = false := by decide
example : casinoRatioWithin5pct 284 16 = false := by decide
example : casinoRatioWithin5pct 9_499_999 500_001 = false := by decide

-- 分母零でも安全（停止する）
example : casinoRatioWithin5pct 0 0 = true := by decide
example : casinoRatioWithin5pct 0 1 = false := by decide
-- カジノ収入零
example : casinoRatioWithin5pct 100 0 = true := by decide
example : casinoRatioWithin5pct 0 100 = false := by decide

end JapanTaxLaw.SpecialMeasuresCasino
