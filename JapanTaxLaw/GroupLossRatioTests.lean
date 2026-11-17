import JapanTaxLaw.GroupLossRatio

/-!
# GroupLossRatio tests — 法人税法 art. 64の7 割合規則 smoke checks

Decidable smoke tests, pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 割合: 分母0→0
example : safeRatio 3 0 = 0 := by decide
example : safeRatio 0 0 = 0 := by decide
-- 割合: 切り捨て
example : safeRatio 1 2 = 0 := by decide
example : safeRatio 2 3 = 0 := by decide
-- 割合: =1 / 1超キャップ
example : safeRatio 2 2 = 1 := by decide
example : safeRatio 5 2 = 1 := by decide
-- 配分: pool × 割合
example : nonSpecificAllocation 100 2 2 = 100 := by decide
example : nonSpecificAllocation 100 1 2 = 0 := by decide
example : nonSpecificAllocation 100 3 0 = 0 := by decide
example : nonSpecificAllocation 0 5 2 = 0 := by decide

end JapanTaxLaw
