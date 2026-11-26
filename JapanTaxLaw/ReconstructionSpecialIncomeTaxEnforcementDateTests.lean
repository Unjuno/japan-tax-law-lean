import JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate

/-!
# ReconstructionSpecialIncomeTaxEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 424CO0000000016 / revision 424CO0000000016_20260525_507CO0000000244.
平成28年=2016、施行日 2016-01-01。
-/

namespace JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate

example : heiseiToSeireki 28 = 2016 := by decide
example : enforcementDate = (2016, 1, 1) := by decide
example : inForce (2015, 12, 31) = false := by decide
example : inForce (2016, 1, 1) = true := by decide

end JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate
