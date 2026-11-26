import JapanTaxLaw.EnforcementWithinNineMonthsSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.EnforcementWithinNineMonthsTests

open JapanTaxLaw.EnforcementWithinNineMonths
open JapanTaxLaw.EnforcementWithinNineMonthsSpec

example : within 0 = true := by decide
example : within 1 = true := by decide
example : within 8 = true := by decide
example : within 9 = true := by decide
example : within 10 = false := by decide
example : specWithin 8 = true := by decide
example : specWithin 9 = true := by decide
example : specWithin 10 = false := by decide
example : agree 8 := agree_thm 8
example : agree 9 := agree_thm 9
example : agree 10 := agree_thm 10

end JapanTaxLaw.EnforcementWithinNineMonthsTests
