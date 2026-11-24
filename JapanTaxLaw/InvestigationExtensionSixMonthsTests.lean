import JapanTaxLaw.InvestigationExtensionSixMonthsSpec

/-! Kernel-decided boundary examples for 関税定率法 art. 7 (six-month cap). -/

namespace JapanTaxLaw.InvestigationExtensionSixMonthsTests

open JapanTaxLaw.InvestigationExtensionSixMonths
open JapanTaxLaw.InvestigationExtensionSixMonthsSpec

example : maxExtensionMonths = 6 := by decide
example : withinExtension 0 = true := by decide
example : withinExtension 1 = true := by decide
example : withinExtension 6 = true := by decide
example : withinExtension 7 = false := by decide
example : specWithin 0 = true := by decide
example : specWithin 6 = true := by decide
example : specWithin 7 = false := by decide
example : agreeWithin 0 := agree_within 0
example : agreeWithin 1 := agree_within 1
example : agreeWithin 11 := agree_within 11
example : agreeWithin 12 := agree_within 12
example : agreeWithin 13 := agree_within 13

end JapanTaxLaw.InvestigationExtensionSixMonthsTests
