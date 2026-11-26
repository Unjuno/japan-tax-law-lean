import JapanTaxLaw.TobaccoSpecialTaxEnforcementDate

/-!
# TobaccoSpecialTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 410CO0000000345 / revision 410CO0000000345_20241001_506CO0000000147.
平成10年=1998、施行日 1998-12-01。
-/

namespace JapanTaxLaw.TobaccoSpecialTaxEnforcementDate

example : heiseiToSeireki 10 = 1998 := by decide
example : enforcementDate = (1998, 12, 1) := by decide
example : inForce (1998, 11, 30) = false := by decide
example : inForce (1998, 12, 1) = true := by decide

end JapanTaxLaw.TobaccoSpecialTaxEnforcementDate
