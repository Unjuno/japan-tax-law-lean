import JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate

/-!
# HeavyOilQuotaOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 336M50000400035 / revision 336M50000400035_20201228_502M60000400092.
平成24年=2012、施行日 2012-03-19。
-/

namespace JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate

example : heiseiToSeireki 24 = 2012 := by decide
example : enforcementDate = (2012, 3, 19) := by decide
example : inForce (2012, 3, 18) = false := by decide
example : inForce (2012, 3, 19) = true := by decide

end JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate
