import JapanTaxLaw.PopulationAge65Spec

/-! Kernel-decided boundary examples: 0/64/65/66 歳. -/

namespace JapanTaxLaw.PopulationAge65Tests

open JapanTaxLaw.PopulationAge65
open JapanTaxLaw.PopulationAge65Spec

example : isAge65OrOver 0 = false := by decide
example : isAge65OrOver 64 = false := by decide
example : isAge65OrOver 65 = true := by decide
example : isAge65OrOver 66 = true := by decide
example : specWithin 64 = false := by decide
example : specWithin 65 = true := by decide
example : specWithin 66 = true := by decide
example : agree 0 := agree_thm 0
example : agree 64 := agree_thm 64
example : agree 65 := agree_thm 65
example : agree 66 := agree_thm 66

end JapanTaxLaw.PopulationAge65Tests
