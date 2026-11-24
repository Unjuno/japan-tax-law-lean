import JapanTaxLaw.CourseHours120Spec

/-! Kernel-decided boundary examples: 0/119/120/121 時間. -/

namespace JapanTaxLaw.CourseHours120Tests

open JapanTaxLaw.CourseHours120
open JapanTaxLaw.CourseHours120Spec

example : hasCourse120 0 = false := by decide
example : hasCourse120 119 = false := by decide
example : hasCourse120 120 = true := by decide
example : hasCourse120 121 = true := by decide
example : specWithin 119 = false := by decide
example : specWithin 120 = true := by decide
example : specWithin 121 = true := by decide
example : agree 0 := agree_thm 0
example : agree 119 := agree_thm 119
example : agree 120 := agree_thm 120
example : agree 121 := agree_thm 121

end JapanTaxLaw.CourseHours120Tests
