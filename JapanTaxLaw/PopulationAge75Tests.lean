import JapanTaxLaw.PopulationAge75Spec

/-! Kernel-decided boundary examples: 0/74/75/76 歳. -/

namespace JapanTaxLaw.PopulationAge75Tests

open JapanTaxLaw.PopulationAge75
open JapanTaxLaw.PopulationAge75Spec

example : isAge75OrOver 0 = false := by decide
example : isAge75OrOver 74 = false := by decide
example : isAge75OrOver 75 = true := by decide
example : isAge75OrOver 76 = true := by decide
example : specWithin 74 = false := by decide
example : specWithin 75 = true := by decide
example : specWithin 76 = true := by decide
example : agree 0 := agree_thm 0
example : agree 74 := agree_thm 74
example : agree 75 := agree_thm 75
example : agree 76 := agree_thm 76

end JapanTaxLaw.PopulationAge75Tests
