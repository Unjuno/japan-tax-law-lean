import JapanTaxLaw.TaxErasureTotal60Spec

/-! Kernel-decided boundary examples: 0/59/60/61 日. -/

namespace JapanTaxLaw.TaxErasureTotal60Tests

open JapanTaxLaw.TaxErasureTotal60
open JapanTaxLaw.TaxErasureTotal60Spec

example : withinTotalErasure 0 = true := by decide
example : withinTotalErasure 59 = true := by decide
example : withinTotalErasure 60 = true := by decide
example : withinTotalErasure 61 = false := by decide
example : specWithin 59 = true := by decide
example : specWithin 60 = true := by decide
example : specWithin 61 = false := by decide
example : agree 0 := agree_thm 0
example : agree 59 := agree_thm 59
example : agree 60 := agree_thm 60
example : agree 61 := agree_thm 61

end JapanTaxLaw.TaxErasureTotal60Tests
