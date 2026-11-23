import JapanTaxLaw.DeceasedUnder70Spec

/-! Kernel-decided boundary examples: 0/69/70/71 歳. -/

namespace JapanTaxLaw.DeceasedUnder70Tests

open JapanTaxLaw.DeceasedUnder70
open JapanTaxLaw.DeceasedUnder70Spec

example : isDeceasedUnder70 0 = true := by decide
example : isDeceasedUnder70 69 = true := by decide
example : isDeceasedUnder70 70 = false := by decide
example : isDeceasedUnder70 71 = false := by decide
example : specWithin 69 = true := by decide
example : specWithin 70 = false := by decide
example : specWithin 71 = false := by decide
example : agree 0 := agree_thm 0
example : agree 69 := agree_thm 69
example : agree 70 := agree_thm 70
example : agree 71 := agree_thm 71

end JapanTaxLaw.DeceasedUnder70Tests
