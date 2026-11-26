import JapanTaxLaw.MutualDefenseAidAgreementEnforcementDate

/-!
# MutualDefenseAidAgreementEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 327AC0000000113 / revision 329CO0000000103_20250401_507CO0000000006.
昭和64年=1989、施行日 1989-04-01。
-/

namespace JapanTaxLaw.MutualDefenseAidAgreementEnforcementDate

example : showaToSeireki 64 = 1989 := by decide
example : enforcementDate = (1989, 4, 1) := by decide
example : inForce (1989, 3, 31) = false := by decide
example : inForce (1989, 4, 1) = true := by decide

end JapanTaxLaw.MutualDefenseAidAgreementEnforcementDate
