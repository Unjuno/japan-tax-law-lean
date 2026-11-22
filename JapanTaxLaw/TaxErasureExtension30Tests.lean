import JapanTaxLaw.TaxErasureExtension30Spec

/-! Kernel-decided boundary examples: 0/29/30/31 日. -/

namespace JapanTaxLaw.TaxErasureExtension30Tests

open JapanTaxLaw.TaxErasureExtension30
open JapanTaxLaw.TaxErasureExtension30Spec

example : withinExtension 0 = true := by decide
example : withinExtension 29 = true := by decide
example : withinExtension 30 = true := by decide
example : withinExtension 31 = false := by decide
example : specWithin 29 = true := by decide
example : specWithin 30 = true := by decide
example : specWithin 31 = false := by decide
example : agree 0 := agree_thm 0
example : agree 29 := agree_thm 29
example : agree 30 := agree_thm 30
example : agree 31 := agree_thm 31

end JapanTaxLaw.TaxErasureExtension30Tests
