import JapanTaxLaw.TobaccoTaxTransitionEnforcementDate

/-!
# TobaccoTaxTransitionEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 427CO0000000156 / revision 427CO0000000156_20250401_507CO0000000006.
平成29年=2017、施行日 2017-04-01。
-/

namespace JapanTaxLaw.TobaccoTaxTransitionEnforcementDate

example : heiseiToSeireki 29 = 2017 := by decide
example : enforcementDate = (2017, 4, 1) := by decide
example : inForce (2017, 3, 31) = false := by decide
example : inForce (2017, 4, 1) = true := by decide

end JapanTaxLaw.TobaccoTaxTransitionEnforcementDate
