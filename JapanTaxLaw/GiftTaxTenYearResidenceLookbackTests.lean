import JapanTaxLaw.GiftTaxTenYearResidenceLookbackSpec

/-!
# GiftTaxTenYearResidenceLookback tests — kernel-decided boundary checks

Pinned to law 325AC0000000073 / revision 325AC0000000073_20260401_506AC0000000008.
境界: 9 / 10 / 11 年（十年以内）。
-/

namespace JapanTaxLaw.GiftTaxTenYearResidenceLookback

example : withinLookback 0 = true := by decide
example : withinLookback 1 = true := by decide
example : withinLookback 9 = true := by decide
example : withinLookback 10 = true := by decide
example : withinLookback 11 = false := by decide
example : specWithin 9 = true := by decide
example : specWithin 11 = false := by decide
example : lookbackYears = specLookback := by decide

end JapanTaxLaw.GiftTaxTenYearResidenceLookback
