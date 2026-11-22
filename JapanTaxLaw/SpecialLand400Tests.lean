import JapanTaxLaw.SpecialLand400Spec

/-! Kernel-decided boundary examples: 0/399/400/401 ㎡. -/

namespace JapanTaxLaw.SpecialLand400Tests

open JapanTaxLaw.SpecialLand400
open JapanTaxLaw.SpecialLand400Spec

example : withinSpecialLand400 0 = true := by decide
example : withinSpecialLand400 399 = true := by decide
example : withinSpecialLand400 400 = true := by decide
example : withinSpecialLand400 401 = false := by decide
example : specWithin 399 = true := by decide
example : specWithin 400 = true := by decide
example : specWithin 401 = false := by decide
example : agree 0 := agree_thm 0
example : agree 399 := agree_thm 399
example : agree 400 := agree_thm 400
example : agree 401 := agree_thm 401

end JapanTaxLaw.SpecialLand400Tests
