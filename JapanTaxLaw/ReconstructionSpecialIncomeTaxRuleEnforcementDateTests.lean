import JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate

/-!
# ReconstructionSpecialIncomeTaxRuleEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 424M60000040006 / revision 424M60000040006_20260901_506M60000040028.
平成28年=2016、施行日 2016-01-01。
-/

namespace JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate

example : heiseiToSeireki 28 = 2016 := by decide
example : enforcementDate = (2016, 1, 1) := by decide
example : inForce (2015, 12, 31) = false := by decide
example : inForce (2016, 1, 1) = true := by decide

end JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate
