import JapanTaxLaw.EnforcementWithinSixMonthsSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.EnforcementWithinSixMonthsTests

open JapanTaxLaw.EnforcementWithinSixMonths
open JapanTaxLaw.EnforcementWithinSixMonthsSpec

example : within 0 = true := by decide
example : within 1 = true := by decide
example : within 5 = true := by decide
example : within 6 = true := by decide
example : within 7 = false := by decide
example : specWithin 5 = true := by decide
example : specWithin 6 = true := by decide
example : specWithin 7 = false := by decide
example : agree 5 := agree_thm 5
example : agree 6 := agree_thm 6
example : agree 7 := agree_thm 7

end JapanTaxLaw.EnforcementWithinSixMonthsTests
