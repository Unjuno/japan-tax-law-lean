import JapanTaxLaw.InheritanceAnnuityValuation

/-!
# InheritanceAnnuityValuation tests — 相続税法 art. 25 smoke checks

Decidable smoke tests, pinned to Law id 325AC0000000073 /
  revision 325AC0000000073_20260401_506AC0000000008 / enforcement 2026-04-01.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 第1号: 解約返戻金の定めなし → 基礎額×90%
example : annuityRightValue true 1_000_000 = 900_000 := by decide
example : annuityRightValue true 100 = 90 := by decide
example : annuityRightValue true 1 = 0 := by decide  -- 切り捨て
-- 第2号: 解約返戻金そのまま
example : annuityRightValue false 1_000_000 = 1_000_000 := by decide
example : annuityRightValue false 0 = 0 := by decide

end JapanTaxLaw
