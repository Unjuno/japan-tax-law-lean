import JapanTaxLaw.IncomeArt205Withholding

/-!
# IncomeArt205Withholding tests — kernel-decided smoke checks

Decidable smoke tests for the 所得税法 art. 205 bounded model, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

No new theorem names are introduced; every check is an `example ... := by decide`.
Boundaries covered: 0, 百万円ちょうど / 超え, 控除 > 金額 (saturating → 0),
and floor rounding (端数).
-/

namespace JapanTaxLaw.IncomeArt205Withholding

-- ==== 税率定数・閾値 ====

example : art205BasicRate.num = 10 := by decide
example : art205BasicRate.den = 100 := by decide
example : art205ExcessRate.num = 20 := by decide
example : art205ExcessRate.den = 100 := by decide
example : art205Threshold = 1_000_000 := by decide

-- ==== 一号: 百万円境界 (10% → 20% の超過部分のみ) ====

example : art205Tax 0 = 0 := by decide
example : art205Tax 10 = 1 := by decide
example : art205Tax 9 = 0 := by decide                       -- 端数切り捨て
example : art205Tax 999_999 = 99_999 := by decide            -- 百万円未満
example : art205Tax 1_000_000 = 100_000 := by decide         -- ちょうど百万円
example : art205Tax 1_000_001 = 100_000 := by decide         -- 1円超: 20%×1 = 0
example : art205Tax 1_000_005 = 100_001 := by decide         -- 20%×5 = 1 (端数)
example : art205Tax 1_000_100 = 100_020 := by decide         -- 20%×100 = 20
example : art205Tax 1_100_000 = 120_000 := by decide
example : art205Tax 2_000_000 = 300_000 := by decide

-- ==== 一号: 閾値を超えても基本部分は 100,000 のまま ====

example : art205Tax 1_000_000 = 100_000 +
          art205ExcessRate.applyFloor (1_000_000 - 1_000_000) := by decide
example : art205Tax 2_000_000 > art205Tax 1_000_000 := by decide

-- ==== 二号: 政令控除額は caller-established（saturating） ====

example : art205TaxAfterDeduction 0 0 = 0 := by decide
example : art205TaxAfterDeduction 100 50 = 5 := by decide
example : art205TaxAfterDeduction 9 0 = 0 := by decide        -- 端数切り捨て
example : art205TaxAfterDeduction 1_000_000 0 = 100_000 := by decide
example : art205TaxAfterDeduction 1_000_000 200_000 = 80_000 := by decide
example : art205TaxAfterDeduction 100 200 = 0 := by decide    -- 控除 > 金額 → 0
example : art205TaxAfterDeduction 0 1 = 0 := by decide        -- 控除 > 金額 → 0

end JapanTaxLaw.IncomeArt205Withholding
