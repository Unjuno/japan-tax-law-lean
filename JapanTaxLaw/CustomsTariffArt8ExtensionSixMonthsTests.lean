import JapanTaxLaw.CustomsTariffArt8ExtensionSixMonthsSpec

/-!
# CustomsTariffArt8ExtensionSixMonths tests — kernel-decided boundary checks

Pinned to law 143AC0000000054 / revision 143AC0000000054_20260601_508AC0000000005.
境界: 5 / 6 / 7 月（六月以内）。
-/

namespace JapanTaxLaw.CustomsTariffArt8ExtensionSixMonths

example : extensionAllowed 0 = true := by decide
example : extensionAllowed 1 = true := by decide
example : extensionAllowed 5 = true := by decide
example : extensionAllowed 6 = true := by decide
example : extensionAllowed 7 = false := by decide
example : specWithinLimit 5 = true := by decide
example : specWithinLimit 7 = false := by decide
example : limitMonths = specMaxMonths := by decide

end JapanTaxLaw.CustomsTariffArt8ExtensionSixMonths
