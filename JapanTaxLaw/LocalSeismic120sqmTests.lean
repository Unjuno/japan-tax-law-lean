import JapanTaxLaw.LocalSeismic120sqmSpec

/-! Kernel-decided boundary examples: 0/119/120/121 ㎡. -/

namespace JapanTaxLaw.LocalSeismic120sqmTests

open JapanTaxLaw.LocalSeismic120sqm
open JapanTaxLaw.LocalSeismic120sqmSpec

example : exceedsSeismic120 0 = false := by decide
example : exceedsSeismic120 119 = false := by decide
example : exceedsSeismic120 120 = false := by decide
example : exceedsSeismic120 121 = true := by decide
example : specWithin 119 = false := by decide
example : specWithin 120 = false := by decide
example : specWithin 121 = true := by decide
example : agree 0 := agree_thm 0
example : agree 119 := agree_thm 119
example : agree 120 := agree_thm 120
example : agree 121 := agree_thm 121

end JapanTaxLaw.LocalSeismic120sqmTests
