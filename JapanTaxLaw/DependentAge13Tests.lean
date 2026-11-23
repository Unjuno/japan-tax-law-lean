import JapanTaxLaw.DependentAge13Spec

/-! Kernel-decided boundary examples: 0/12/13/14 歳. -/

namespace JapanTaxLaw.DependentAge13Tests

open JapanTaxLaw.DependentAge13
open JapanTaxLaw.DependentAge13Spec

example : isDependentAge13 0 = false := by decide
example : isDependentAge13 12 = false := by decide
example : isDependentAge13 13 = true := by decide
example : isDependentAge13 14 = true := by decide
example : specWithin 12 = false := by decide
example : specWithin 13 = true := by decide
example : specWithin 14 = true := by decide
example : agree 0 := agree_thm 0
example : agree 12 := agree_thm 12
example : agree 13 := agree_thm 13
example : agree 14 := agree_thm 14

end JapanTaxLaw.DependentAge13Tests
