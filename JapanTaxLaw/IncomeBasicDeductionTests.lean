import JapanTaxLaw.IncomeBasicDeduction

/-!
# IncomeBasicDeduction tests — kernel-decided smoke checks

Decidable smoke tests for the 所得税法 art. 86 bounded model, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

No new theorem names are introduced; every check is an `example ... := by decide`.
All eight boundary values from the pinned source are covered verbatim.
-/ 

namespace JapanTaxLaw.IncomeBasicDeduction

open JapanTaxLaw.TaxFinance

-- ==== art. 86: 区分定数（原文の日本語数字を検証） ====

example : basicDeductionLe2350 = 580_000 := by decide  -- 五十八万円
example : basicDeductionLe2400 = 480_000 := by decide  -- 四十八万円
example : basicDeductionLe2450 = 320_000 := by decide  -- 三十二万円
example : basicDeductionLe2500 = 160_000 := by decide  -- 十六万円

-- ==== art. 86: 全境界値（23_500_000 / 23_500_001 / 24_000_000 / 24_000_001 /
--      24_500_000 / 24_500_001 / 25_000_000 / 25_000_001） ====

example : basicDeductionAmount 23_500_000 = 580_000 := by decide
example : basicDeductionAmount 23_500_001 = 480_000 := by decide
example : basicDeductionAmount 24_000_000 = 480_000 := by decide
example : basicDeductionAmount 24_000_001 = 320_000 := by decide
example : basicDeductionAmount 24_500_000 = 320_000 := by decide
example : basicDeductionAmount 24_500_001 = 160_000 := by decide
example : basicDeductionAmount 25_000_000 = 160_000 := by decide
example : basicDeductionAmount 25_000_001 = 0 := by decide

-- 境界外の補助点
example : basicDeductionAmount 0 = 580_000 := by decide
example : basicDeductionAmount 99_999_999 = 0 := by decide

-- ==== art. 86: 控除後（saturating） ====

example : taxableAfterBasicDeduction 1_000_000 580_000 = 420_000 := by decide
example : taxableAfterBasicDeduction 580_000 580_000 = 0 := by decide
example : taxableAfterBasicDeduction 100_000 580_000 = 0 := by decide
example : taxableAfterBasicDeduction 0 0 = 0 := by decide
example : taxableAfterBasicDeduction 24_000_000 (basicDeductionAmount 24_000_000) = 23_520_000 := by decide

-- 追加の必須境界 (b) 小さい正の入力 (1..13) と (c) identity/saturation。
-- ((a) 零入力 0 と (c) result 0 は上示例で既にカバー。)
example : basicDeductionAmount 1 = 580_000 := by decide
example : basicDeductionAmount 13 = 580_000 := by decide
example : taxableAfterBasicDeduction 13 0 = 13 := by decide  -- 控除 0 → 入力と一致 (identity)
example : taxableAfterBasicDeduction 5 13 = 0 := by decide  -- 控除 > 所得 → 0 (saturation)

end JapanTaxLaw.IncomeBasicDeduction
