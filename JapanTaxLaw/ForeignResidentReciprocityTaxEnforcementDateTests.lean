import JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate

/-!
# ForeignResidentReciprocityTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 428M60000048005 / revision 428M60000048005_20260101_506M60000048004.
平成30年=2018、施行日 2018-01-01。
-/

namespace JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate

example : heiseiToSeireki 30 = 2018 := by decide
example : enforcementDate = (2018, 1, 1) := by decide
example : inForce (2017, 12, 31) = false := by decide
example : inForce (2018, 1, 1) = true := by decide

end JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate
