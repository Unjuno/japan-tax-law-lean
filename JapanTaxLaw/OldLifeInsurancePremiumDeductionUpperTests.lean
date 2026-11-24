import JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper

/-!
# OldLifeInsurancePremiumDeductionUpper tests — 旧生命保険料控除上段 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
27500 + (total-40000)/4、上限 70000 で 35000。
-/

namespace JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper

example : deduction 44000 = 28500 := by decide
example : deduction 50000 = 30000 := by decide
example : deduction 70000 = 35000 := by decide

end JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper
