import JapanTaxLaw.Stay183DaysSpec

/-! Kernel-decided boundary examples: 0/182/183/184 日. -/

namespace JapanTaxLaw.Stay183DaysTests

open JapanTaxLaw.Stay183Days
open JapanTaxLaw.Stay183DaysSpec

example : withinStay183 0 = true := by decide
example : withinStay183 182 = true := by decide
example : withinStay183 183 = true := by decide
example : withinStay183 184 = false := by decide
example : specWithin 182 = true := by decide
example : specWithin 183 = true := by decide
example : specWithin 184 = false := by decide
example : agree 0 := agree_thm 0
example : agree 182 := agree_thm 182
example : agree 183 := agree_thm 183
example : agree 184 := agree_thm 184

end JapanTaxLaw.Stay183DaysTests
