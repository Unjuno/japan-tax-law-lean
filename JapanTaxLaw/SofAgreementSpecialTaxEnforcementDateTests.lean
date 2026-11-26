import JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate

/-!
# SofAgreementSpecialTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 327AC0000000113 / revision 327AC0000000113_20260401_508AC0000000012.
昭和60年=1985、施行日 1985-04-01。
-/

namespace JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate

example : showaToSeireki 60 = 1985 := by decide
example : enforcementDate = (1985, 4, 1) := by decide
example : inForce (1985, 3, 31) = false := by decide
example : inForce (1985, 4, 1) = true := by decide

end JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate
