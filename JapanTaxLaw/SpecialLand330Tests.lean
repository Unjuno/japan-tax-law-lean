import JapanTaxLaw.SpecialLand330Spec

/-! Kernel-decided boundary examples: 0/329/330/331 ㎡. -/

namespace JapanTaxLaw.SpecialLand330Tests

open JapanTaxLaw.SpecialLand330
open JapanTaxLaw.SpecialLand330Spec

example : withinSpecialLand330 0 = true := by decide
example : withinSpecialLand330 329 = true := by decide
example : withinSpecialLand330 330 = true := by decide
example : withinSpecialLand330 331 = false := by decide
example : specWithin 329 = true := by decide
example : specWithin 330 = true := by decide
example : specWithin 331 = false := by decide
example : agree 0 := agree_thm 0
example : agree 329 := agree_thm 329
example : agree 330 := agree_thm 330
example : agree 331 := agree_thm 331

end JapanTaxLaw.SpecialLand330Tests
