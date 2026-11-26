import JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate

/-!
# TobaccoSpecialTaxRuleEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 410M50000040122 / revision 410M50000040122_20150401_427M60000040039.
平成16年=2004、施行日 2004-01-19。
-/

namespace JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate

example : heiseiToSeireki 16 = 2004 := by decide
example : enforcementDate = (2004, 1, 19) := by decide
example : inForce (2004, 1, 18) = false := by decide
example : inForce (2004, 1, 19) = true := by decide

end JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate
