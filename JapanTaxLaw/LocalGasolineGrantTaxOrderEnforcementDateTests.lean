import JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate

/-!
# LocalGasolineGrantTaxOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 344CO0000000088 / revision 344CO0000000088_20090401_421CO0000000100.
昭和51年=1976、施行日 1976-04-01。
-/

namespace JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate

example : showaToSeireki 51 = 1976 := by decide
example : enforcementDate = (1976, 4, 1) := by decide
example : inForce (1976, 3, 31) = false := by decide
example : inForce (1976, 4, 1) = true := by decide

end JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate
