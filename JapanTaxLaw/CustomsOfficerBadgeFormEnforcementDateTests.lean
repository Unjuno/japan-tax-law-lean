import JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate

/-!
# CustomsOfficerBadgeFormEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 329M50000040064 / revision 329M50000040064_20220401_504M60000040011.
昭和52年=1977、施行日 1977-07-01。
-/

namespace JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate

example : showaToSeireki 52 = 1977 := by decide
example : enforcementDate = (1977, 7, 1) := by decide
example : inForce (1977, 6, 30) = false := by decide
example : inForce (1977, 7, 1) = true := by decide

end JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate
