import JapanTaxLaw.ConstructionCost1MSpec

/-! Kernel-decided boundary examples: 0/999999/1000000/1000001 円. -/

namespace JapanTaxLaw.ConstructionCost1MTests

open JapanTaxLaw.ConstructionCost1M
open JapanTaxLaw.ConstructionCost1MSpec

example : exceedsCost 0 = false := by decide
example : exceedsCost 999999 = false := by decide
example : exceedsCost 1000000 = false := by decide
example : exceedsCost 1000001 = true := by decide
example : specWithin 999999 = false := by decide
example : specWithin 1000000 = false := by decide
example : specWithin 1000001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 999999 := agree_thm 999999
example : agree 1000000 := agree_thm 1000000
example : agree 1000001 := agree_thm 1000001

end JapanTaxLaw.ConstructionCost1MTests
