import JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate

/-!
# ReconstructionSpecialCorporationTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 424M60000040007 / revision 424M60000040007_20210415_503M60000040045.
平成24年=2012、施行日 2012-04-01。
-/

namespace JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate

example : heiseiToSeireki 24 = 2012 := by decide
example : enforcementDate = (2012, 4, 1) := by decide
example : inForce (2012, 3, 31) = false := by decide
example : inForce (2012, 4, 1) = true := by decide

end JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate
