import JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate

/-!
# ForeignCapitalSpecialOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 340CO0000000084 / revision 340CO0000000084_20171001_429CO0000000106.
平成26年=2014、施行日 2014-04-01。
-/

namespace JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate

example : heiseiToSeireki 26 = 2014 := by decide
example : enforcementDate = (2014, 4, 1) := by decide
example : inForce (2014, 3, 31) = false := by decide
example : inForce (2014, 4, 1) = true := by decide

end JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate
