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

-- saturating 境界: 適格範囲外（蒸留酒 13°: 13<11 も 13<13 も偽）の特別税率は none。
-- none を既定値 0 に落とすと税額 0（結果 0 の saturation、入力 13 は 1..13 の小さい正の入力）
example : (lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 13).getD 0 = 0 := by decide

end JapanTaxLaw
