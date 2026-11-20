import JapanTaxLaw.AncillaryTaxBaseRoundingUnitSpec

/-!
# Boundary tests — 国税通則法 art. 118(3)

All cases are kernel-decided (`by decide`), not a finite stand-in for the
universal correspondence theorem in the Spec module.
-/


namespace JapanTaxLaw.AncillaryTaxBaseRoundingUnit

open JapanTaxLaw.TaxFinance

/-- 0円 → 0. -/
example : baseAmount 0 = 0 := by decide

/-- 9,999円 (全額が一万円未満) → 0. -/
example : baseAmount 9999 = 0 := by decide

/-- 10,000円 (境界) → 10,000. -/
example : baseAmount 10000 = 10000 := by decide

/-- 10,001円 (端数あり) → 10,000. -/
example : baseAmount 10001 = 10000 := by decide

/-- 19,999円 → 10,000. -/
example : baseAmount 19999 = 10000 := by decide

/-- 20,000円 (次の境界) → 20,000. -/
example : baseAmount 20000 = 20000 := by decide

/-- 切り捨て後は単位の整数倍（境界値で確認）. -/
example : baseAmount 12345 % 10000 = 0 := by decide
example : baseAmount 99999 % 10000 = 0 := by decide

end JapanTaxLaw.AncillaryTaxBaseRoundingUnit
