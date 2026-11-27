import JapanTaxLaw.InternationalTouristTaxEnforcementDate

/-!
# InternationalTouristTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 430CO0000000161 / revision 430CO0000000161_20190107_000000000000000.
平成31年=2019、施行日 2019-01-07。
-/

namespace JapanTaxLaw.InternationalTouristTaxEnforcementDate

example : heiseiToSeireki 31 = 2019 := by decide
example : enforcementDate = (2019, 1, 7) := by decide
example : inForce (2019, 1, 6) = false := by decide
example : inForce (2019, 1, 7) = true := by decide

end JapanTaxLaw.InternationalTouristTaxEnforcementDate
