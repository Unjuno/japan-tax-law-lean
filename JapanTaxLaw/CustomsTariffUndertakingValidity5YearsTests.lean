import JapanTaxLaw.CustomsTariffUndertakingValidity5YearsSpec

/-!
# CustomsTariffUndertakingValidity5Years tests — kernel-decided boundary checks

Pinned to law 143AC0000000054 / revision 143AC0000000054_20260601_508AC0000000005.
境界: 4 / 5 / 6 年（五年以内）。
-/

namespace JapanTaxLaw.CustomsTariffUndertakingValidity5Years

example : undertakingAcceptable 0 = true := by decide
example : undertakingAcceptable 1 = true := by decide
example : undertakingAcceptable 4 = true := by decide
example : undertakingAcceptable 5 = true := by decide
example : undertakingAcceptable 6 = false := by decide
example : specWithinValidity 4 = true := by decide
example : specWithinValidity 6 = false := by decide
example : maxValidityYears = specMaxYears := by decide

end JapanTaxLaw.CustomsTariffUndertakingValidity5Years
