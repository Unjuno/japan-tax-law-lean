import JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate

/-!
# CustomsTariffSupplArt1Showa59EnforcementDateTests — 施行日 smoke checks
Decidable smoke tests, pinned to law 143AC0000000054 / revision 143AC0000000054_20260601_508AC0000000005.
昭和59年=1984、施行日 1984-04-01。
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate

example : showaToSeireki 59 = 1984 := by decide
example : enforcementDate = (1984, 4, 1) := by decide
example : enforcementKey = 19840401 := by decide
example : inForce (1984, 3, 31) = false := by decide
example : inForce (1984, 4, 1) = true := by decide
example : inForce (1984, 4, 2) = true := by decide

end JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate
