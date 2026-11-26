import JapanTaxLaw.PurebredLivestockCertificateEnforcementDate

/-!
# PurebredLivestockCertificateEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 407M50000200013 / revision 407M50000200013_20201221_502M60000200083.
平成12年=2000、施行日 2000-04-01。
-/

namespace JapanTaxLaw.PurebredLivestockCertificateEnforcementDate

example : heiseiToSeireki 12 = 2000 := by decide
example : enforcementDate = (2000, 4, 1) := by decide
example : inForce (2000, 3, 31) = false := by decide
example : inForce (2000, 4, 1) = true := by decide

end JapanTaxLaw.PurebredLivestockCertificateEnforcementDate
