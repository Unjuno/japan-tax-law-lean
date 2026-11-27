import JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate

/-!
# LocalCorporationTaxRuleEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 426M60000040022 / revision 426M60000040022_20260414_508M60000040040.
平成26年=2014、施行日 2014-10-01。
-/

namespace JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate

example : heiseiToSeireki 26 = 2014 := by decide
example : enforcementDate = (2014, 10, 1) := by decide
example : inForce (2014, 9, 30) = false := by decide
example : inForce (2014, 10, 1) = true := by decide

end JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate
