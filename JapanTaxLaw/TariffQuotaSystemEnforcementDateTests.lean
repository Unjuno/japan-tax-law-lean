import JapanTaxLaw.TariffQuotaSystemEnforcementDate

/-!
# TariffQuotaSystemEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 336CO0000000153 / revision 336CO0000000153_20260401_508CO0000000085.
平成3年=1991、施行日 1991-04-01。
-/

namespace JapanTaxLaw.TariffQuotaSystemEnforcementDate

example : heiseiToSeireki 3 = 1991 := by decide
example : enforcementDate = (1991, 4, 1) := by decide
example : inForce (1991, 3, 31) = false := by decide
example : inForce (1991, 4, 1) = true := by decide

end JapanTaxLaw.TariffQuotaSystemEnforcementDate
