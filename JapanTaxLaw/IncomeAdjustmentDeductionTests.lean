import JapanTaxLaw.IncomeAdjustmentDeduction

/-!
# IncomeAdjustmentDeduction tests — kernel-decided smoke checks

Decidable smoke tests for the 租税特別措置法 art. 41の3の11 bounded model, pinned to

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013

No new theorem names are introduced; every check is an `example ... := by decide`.
Boundaries covered: 850万円ちょうど／超、1000万円ちょうど／超、十万境界、
両方十万超、合計が十万ちょうど、端数。
-/ 

namespace JapanTaxLaw.IncomeAdjustmentDeduction

open JapanTaxLaw.TaxFinance

-- ==== art. 41の3の11(1): 定数（原文の日本語数字を検証） ====

example : salaryIncomeThreshold = 8_500_000 := by decide  -- 八百五十万円
example : salaryIncomeCap = 10_000_000 := by decide        -- 千万円
example : adjustmentRateNumerator = 10 := by decide       -- 百分の十
example : adjustmentRateDenominator = 100 := by decide
example : smallIncomeCap = 100_000 := by decide           -- 十万円

-- ==== art. 41の3の11(1): 850万円ちょうど／超、1000万円ちょうど／超 ====

example : incomeAdjustmentDeduction1 0 = 0 := by decide
example : incomeAdjustmentDeduction1 8_499_999 = 0 := by decide
example : incomeAdjustmentDeduction1 8_500_000 = 0 := by decide          -- ちょうど
example : incomeAdjustmentDeduction1 8_500_001 = 0 := by decide          -- 超（端数 1）
example : incomeAdjustmentDeduction1 8_500_009 = 0 := by decide          -- 端数 9
example : incomeAdjustmentDeduction1 8_500_010 = 1 := by decide          -- 端数 10
example : incomeAdjustmentDeduction1 8_500_011 = 1 := by decide          -- 端数 11
example : incomeAdjustmentDeduction1 9_000_000 = 50_000 := by decide
example : incomeAdjustmentDeduction1 9_999_999 = 149_999 := by decide
example : incomeAdjustmentDeduction1 10_000_000 = 150_000 := by decide   -- ちょうど
example : incomeAdjustmentDeduction1 10_000_001 = 150_000 := by decide   -- 超（cap）

-- ==== art. 41の3の11(2): 十万境界、合計境界、端数 ====

example : incomeAdjustmentDeduction2 0 0 = 0 := by decide
example : incomeAdjustmentDeduction2 99_999 0 = 0 := by decide
example : incomeAdjustmentDeduction2 100_000 0 = 0 := by decide          -- 十万ちょうど
example : incomeAdjustmentDeduction2 99_999 1 = 0 := by decide           -- 合計十万ちょうど
example : incomeAdjustmentDeduction2 99_999 2 = 1 := by decide           -- 端数
example : incomeAdjustmentDeduction2 100_001 0 = 0 := by decide          -- 十万超でも片方 0 なら控除 0
example : incomeAdjustmentDeduction2 200_000 0 = 0 := by decide          -- 年金 0 → cap 効かず
example : incomeAdjustmentDeduction2 50_000 200_000 = 50_000 := by decide
example : incomeAdjustmentDeduction2 200_000 50_000 = 50_000 := by decide
example : incomeAdjustmentDeduction2 200_000 200_000 = 100_000 := by decide
example : incomeAdjustmentDeduction2 1_000_000 1_000_000 = 100_000 := by decide

end JapanTaxLaw.IncomeAdjustmentDeduction
