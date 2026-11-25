import JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper

/-!
# NewIndividualAnnuityPremiumDeductionUpper tests — 新個人年金保険料控除上段 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
22000 + (total-32000)/4、上限 56000 で 28000。
-/

namespace JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper

example : deduction 36000 = 23000 := by decide
example : deduction 40000 = 24000 := by decide
example : deduction 56000 = 28000 := by decide

end JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper
