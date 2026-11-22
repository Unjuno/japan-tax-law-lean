import JapanTaxLaw.AlcoholDegree45Spec

/-! Kernel-decided boundary examples: 0/44/45/46 度. -/

namespace JapanTaxLaw.AlcoholDegree45Tests

open JapanTaxLaw.AlcoholDegree45
open JapanTaxLaw.AlcoholDegree45Spec

example : withinAlcohol45 0 = true := by decide
example : withinAlcohol45 44 = true := by decide
example : withinAlcohol45 45 = true := by decide
example : withinAlcohol45 46 = false := by decide
example : specWithin 44 = true := by decide
example : specWithin 45 = true := by decide
example : specWithin 46 = false := by decide
example : agree 0 := agree_thm 0
example : agree 44 := agree_thm 44
example : agree 45 := agree_thm 45
example : agree 46 := agree_thm 46

end JapanTaxLaw.AlcoholDegree45Tests
