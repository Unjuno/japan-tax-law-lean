import JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate

/-!
# StandardTaxRevenueCalculationEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 429M60000008030 / revision 429M60000008030_20260401_508M60000008048.
平成31年=2019、施行日 2019-04-01。
-/

namespace JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate

example : heiseiToSeireki 31 = 2019 := by decide
example : enforcementDate = (2019, 4, 1) := by decide
example : inForce (2019, 3, 31) = false := by decide
example : inForce (2019, 4, 1) = true := by decide

end JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate
