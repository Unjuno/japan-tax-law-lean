import JapanTaxLaw.CorporateGroupLossOffset

/-!
# CorporateGroupLossOffset tests — art. 64の5 損益通算 smoke checks

Decidable smoke tests, pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- §2（通算対象欠損金額）: partner loss = 100, own income = 80, group income = 80
example : intercompanyLossDeduction ⟨80, 100, 80, 0, 0, 0⟩ = 80 := by decide
-- §2: partner loss = 50, own income = 80, group income = 80
example : intercompanyLossDeduction ⟨80, 50, 80, 0, 0, 0⟩ = 50 := by decide
-- §2: own income 100 of group 200, partner loss 50 → 25
example : intercompanyLossDeduction ⟨100, 50, 200, 0, 0, 0⟩ = 25 := by decide
-- §2: own income 100 of group 300, partner losses 90 → 30
example : intercompanyLossDeduction ⟨100, 90, 300, 0, 0, 0⟩ = 30 := by decide
-- §2: zero group income → 0
example : intercompanyLossDeduction ⟨0, 500, 0, 0, 0, 0⟩ = 0 := by decide
-- §2: integer division floor (400/300 * 100 = 133.33)
example : intercompanyLossDeduction ⟨400, 100, 300, 0, 0, 0⟩ = 133 := by decide
-- §4（通算対象所得金額）: own loss 80，総groupLoss=160有 partner income 200
example : intercompanyIncomeInclusion ⟨0, 0, 0, 80, 200, 160⟩ = 80 := by decide
-- §4: own loss 50 of group loss 100, partner income 200 → 50
example : intercompanyIncomeInclusion ⟨0, 0, 0, 50, 200, 100⟩ = 50 := by decide
-- §4: zero group loss → 0
example : intercompanyIncomeInclusion ⟨0, 0, 0, 0, 100, 0⟩ = 0 := by decide
-- §4: partner income cap by group loss
example : intercompanyIncomeInclusion ⟨0, 0, 0, 80, 200, 100⟩ = 80 := by decide
-- §2: 小入力の floor 境界 — pool = min(2,3) = 2 (超過控除)、2×2/3 = 1 (切り捨て)
example : intercompanyLossDeduction ⟨2, 2, 3, 0, 0, 0⟩ = 1 := by decide

end JapanTaxLaw
