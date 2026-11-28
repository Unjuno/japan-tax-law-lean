import JapanTaxLaw.CustomsTariffSupplArt1Showa60EnforcementDate

/-!
# CustomsTariffSupplArt1Showa60EnforcementDateTests — 施行日 smoke checks
Decidable smoke tests, pinned to law 143AC0000000054 / revision 143AC0000000054_20260601_508AC0000000005.
昭和60年=1985、施行日 1985-04-01。
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Showa60EnforcementDate

example : showaToSeireki 60 = 1985 := by decide
example : enforcementDate = (1985, 4, 1) := by decide
example : enforcementKey = 19850401 := by decide
example : inForce (1985, 3, 31) = false := by decide
example : inForce (1985, 4, 1) = true := by decide
example : inForce (1985, 4, 2) = true := by decide

end JapanTaxLaw.CustomsTariffSupplArt1Showa60EnforcementDate
