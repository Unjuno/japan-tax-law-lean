import JapanTaxLaw.LowAlcoholDutySpecialRate

/-!
# LowAlcoholDutySpecialRate tests — 租税特別措置法 art. 87の2 smoke checks

Decidable smoke tests, pinned to
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 87の2: 蒸留酒類は 13° 未満、リキュールは 12° 未満が対象
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 0 = some 100_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 10 = some 100_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 11 = some 110_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 12 = some 120_000 := by decide
-- 適格境界
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 13 = none := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.liqueur 11 = some 110_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.liqueur 12 = none := by decide

-- Eligibility
example : lowAlcoholDutyEligible LowAlcoholCategory.distilled 12 = true := by decide
example : lowAlcoholDutyEligible LowAlcoholCategory.distilled 13 = false := by decide
example : lowAlcoholDutyEligible LowAlcoholCategory.liqueur 11 = true := by decide
example : lowAlcoholDutyEligible LowAlcoholCategory.liqueur 12 = false := by decide

end JapanTaxLaw
