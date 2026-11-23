import JapanTaxLaw.QuakeFloor50sqmSpec

/-! Kernel-decided boundary examples: 0/49/50/51 ㎡. -/

namespace JapanTaxLaw.QuakeFloor50sqmTests

open JapanTaxLaw.QuakeFloor50sqm
open JapanTaxLaw.QuakeFloor50sqmSpec

example : hasFloor50 0 = false := by decide
example : hasFloor50 49 = false := by decide
example : hasFloor50 50 = true := by decide
example : hasFloor50 51 = true := by decide
example : specWithin 49 = false := by decide
example : specWithin 50 = true := by decide
example : specWithin 51 = true := by decide
example : agree 0 := agree_thm 0
example : agree 49 := agree_thm 49
example : agree 50 := agree_thm 50
example : agree 51 := agree_thm 51

end JapanTaxLaw.QuakeFloor50sqmTests
