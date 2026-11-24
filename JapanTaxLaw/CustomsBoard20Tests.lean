import JapanTaxLaw.CustomsBoard20Spec

/-! Kernel-decided boundary examples: 0/19/20/21 人. -/

namespace JapanTaxLaw.CustomsBoard20Tests

open JapanTaxLaw.CustomsBoard20
open JapanTaxLaw.CustomsBoard20Spec

example : withinBoard20 0 = true := by decide
example : withinBoard20 19 = true := by decide
example : withinBoard20 20 = true := by decide
example : withinBoard20 21 = false := by decide
example : specWithin 19 = true := by decide
example : specWithin 20 = true := by decide
example : specWithin 21 = false := by decide
example : agree 0 := agree_thm 0
example : agree 19 := agree_thm 19
example : agree 20 := agree_thm 20
example : agree 21 := agree_thm 21

end JapanTaxLaw.CustomsBoard20Tests
