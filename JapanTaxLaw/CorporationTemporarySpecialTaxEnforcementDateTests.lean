import JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate

/-!
# CorporationTemporarySpecialTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 403M50000040006 / revision 403M50000040006_20030106_414M60000040072.
平成15年=2003、施行日 2003-01-06。
-/

namespace JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate

example : heiseiToSeireki 15 = 2003 := by decide
example : enforcementDate = (2003, 1, 6) := by decide
example : inForce (2003, 1, 5) = false := by decide
example : inForce (2003, 1, 6) = true := by decide

end JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate
