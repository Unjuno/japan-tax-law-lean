import JapanTaxLaw.LifeInsurancePremiumDeduction

/-!
# LifeInsurancePremiumDeduction tests — 新生命保険料控除中段 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
12000 + (total-12000)/2、上限 32000 で 22000。
-/

namespace JapanTaxLaw.LifeInsurancePremiumDeduction

example : deduction 13000 = 12500 := by decide
example : deduction 22000 = 17000 := by decide
example : deduction 32000 = 22000 := by decide

end JapanTaxLaw.LifeInsurancePremiumDeduction
