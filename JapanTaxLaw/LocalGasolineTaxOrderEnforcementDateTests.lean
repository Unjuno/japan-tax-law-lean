import JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate

/-!
# LocalGasolineTaxOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 330CO0000000151 / revision 330CO0000000151_20241001_506CO0000000148.
昭和41年=1966、施行日 1966-04-01。
-/

namespace JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate

example : showaToSeireki 41 = 1966 := by decide
example : enforcementDate = (1966, 4, 1) := by decide
example : inForce (1966, 3, 31) = false := by decide
example : inForce (1966, 4, 1) = true := by decide

end JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate
