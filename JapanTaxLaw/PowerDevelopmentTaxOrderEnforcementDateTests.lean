import JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate

/-!
# PowerDevelopmentTaxOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 349CO0000000339 / revision 349CO0000000339_20250401_507CO0000000006.
平成12年=2000、施行日 2000-03-21。
-/

namespace JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate

example : heiseiToSeireki 12 = 2000 := by decide
example : enforcementDate = (2000, 3, 21) := by decide
example : inForce (2000, 3, 20) = false := by decide
example : inForce (2000, 3, 21) = true := by decide

end JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate
