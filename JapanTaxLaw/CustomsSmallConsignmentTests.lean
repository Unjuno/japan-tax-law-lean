import JapanTaxLaw.CustomsSmallConsignment

/-!
# CustomsSmallConsignment tests — 関税定率法 art. 3の3 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 3の3: 閾値 20万円
example : smallConsignmentThreshold = 200_000 := by rfl
-- 境界: 以下は適用、超過は非適用
example : smallConsignmentApplies 200_000 false false = true := by decide
example : smallConsignmentApplies 199_999 false false = true := by decide
example : smallConsignmentApplies 200_001 false false = false := by decide
example : smallConsignmentApplies 0 false false = true := by decide
-- 除外貨物・申出済みは非適用
example : smallConsignmentApplies 100_000 true false = false := by decide
example : smallConsignmentApplies 100_000 false true = false := by decide
example : smallConsignmentApplies 100_000 true true = false := by decide

end JapanTaxLaw
