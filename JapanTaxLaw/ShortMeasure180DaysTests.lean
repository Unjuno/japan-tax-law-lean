import JapanTaxLaw.ShortMeasure180DaysSpec

/-! Kernel-decided boundary examples: 0/179/180/181 日. -/

namespace JapanTaxLaw.ShortMeasure180DaysTests

open JapanTaxLaw.ShortMeasure180Days
open JapanTaxLaw.ShortMeasure180DaysSpec

example : withinShortMeasure 0 = true := by decide
example : withinShortMeasure 179 = true := by decide
example : withinShortMeasure 180 = true := by decide
example : withinShortMeasure 181 = false := by decide
example : specWithin 179 = true := by decide
example : specWithin 180 = true := by decide
example : specWithin 181 = false := by decide
example : agree 0 := agree_thm 0
example : agree 179 := agree_thm 179
example : agree 180 := agree_thm 180
example : agree 181 := agree_thm 181

end JapanTaxLaw.ShortMeasure180DaysTests
