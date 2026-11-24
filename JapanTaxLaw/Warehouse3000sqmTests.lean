import JapanTaxLaw.Warehouse3000sqmSpec

/-! Kernel-decided boundary examples: 0/2999/3000/3001 ㎡. -/

namespace JapanTaxLaw.Warehouse3000sqmTests

open JapanTaxLaw.Warehouse3000sqm
open JapanTaxLaw.Warehouse3000sqmSpec

example : hasWarehouse3000 0 = false := by decide
example : hasWarehouse3000 2999 = false := by decide
example : hasWarehouse3000 3000 = true := by decide
example : hasWarehouse3000 3001 = true := by decide
example : specWithin 2999 = false := by decide
example : specWithin 3000 = true := by decide
example : specWithin 3001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 2999 := agree_thm 2999
example : agree 3000 := agree_thm 3000
example : agree 3001 := agree_thm 3001

end JapanTaxLaw.Warehouse3000sqmTests
