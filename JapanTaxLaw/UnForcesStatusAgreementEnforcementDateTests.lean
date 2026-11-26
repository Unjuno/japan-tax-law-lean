import JapanTaxLaw.UnForcesStatusAgreementEnforcementDate

/-!
# UnForcesStatusAgreementEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 329AC0000000188 / revision 329AC0000000188_20260401_508AC0000000002.
昭和35年=1960、施行日 1960-07-01。
-/

namespace JapanTaxLaw.UnForcesStatusAgreementEnforcementDate

example : showaToSeireki 35 = 1960 := by decide
example : enforcementDate = (1960, 7, 1) := by decide
example : inForce (1960, 6, 30) = false := by decide
example : inForce (1960, 7, 1) = true := by decide

end JapanTaxLaw.UnForcesStatusAgreementEnforcementDate
