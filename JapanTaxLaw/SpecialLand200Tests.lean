import JapanTaxLaw.SpecialLand200Spec

/-! Kernel-decided boundary examples: 0/199/200/201 ㎡. -/

namespace JapanTaxLaw.SpecialLand200Tests

open JapanTaxLaw.SpecialLand200
open JapanTaxLaw.SpecialLand200Spec

example : withinSpecialLand200 0 = true := by decide
example : withinSpecialLand200 199 = true := by decide
example : withinSpecialLand200 200 = true := by decide
example : withinSpecialLand200 201 = false := by decide
example : specWithin 199 = true := by decide
example : specWithin 200 = true := by decide
example : specWithin 201 = false := by decide
example : agree 0 := agree_thm 0
example : agree 199 := agree_thm 199
example : agree 200 := agree_thm 200
example : agree 201 := agree_thm 201

end JapanTaxLaw.SpecialLand200Tests
