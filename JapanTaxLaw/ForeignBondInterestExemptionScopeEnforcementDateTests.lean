import JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate

/-!
# ForeignBondInterestExemptionScopeEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 333CO0000000337 / revision 333CO0000000337_20171001_429CO0000000106.
昭和40年=1965、施行日 1965-04-01。
-/

namespace JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate

example : showaToSeireki 40 = 1965 := by decide
example : enforcementDate = (1965, 4, 1) := by decide
example : inForce (1965, 3, 31) = false := by decide
example : inForce (1965, 4, 1) = true := by decide

end JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate
