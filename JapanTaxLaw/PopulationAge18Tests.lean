import JapanTaxLaw.PopulationAge18Spec

/-! Kernel-decided boundary examples: 0/17/18/19 歳. -/

namespace JapanTaxLaw.PopulationAge18Tests

open JapanTaxLaw.PopulationAge18
open JapanTaxLaw.PopulationAge18Spec

example : withinAge18 0 = true := by decide
example : withinAge18 17 = true := by decide
example : withinAge18 18 = true := by decide
example : withinAge18 19 = false := by decide
example : specWithin 17 = true := by decide
example : specWithin 18 = true := by decide
example : specWithin 19 = false := by decide
example : agree 0 := agree_thm 0
example : agree 17 := agree_thm 17
example : agree 18 := agree_thm 18
example : agree 19 := agree_thm 19

end JapanTaxLaw.PopulationAge18Tests
