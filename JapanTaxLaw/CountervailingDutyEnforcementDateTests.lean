import JapanTaxLaw.CountervailingDutyEnforcementDate

/-!
# CountervailingDutyEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 406CO0000000415 / revision 406CO0000000415_20171008_428CO0000000240.
平成13年=2001、施行日 2001-01-06。
-/

namespace JapanTaxLaw.CountervailingDutyEnforcementDate

example : heiseiToSeireki 13 = 2001 := by decide
example : enforcementDate = (2001, 1, 6) := by decide
example : inForce (2001, 1, 5) = false := by decide
example : inForce (2001, 1, 6) = true := by decide

end JapanTaxLaw.CountervailingDutyEnforcementDate
