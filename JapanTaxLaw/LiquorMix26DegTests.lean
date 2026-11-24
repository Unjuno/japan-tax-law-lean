import JapanTaxLaw.LiquorMix26DegSpec

/-! Kernel-decided boundary examples: 0/25/26/27 度. -/

namespace JapanTaxLaw.LiquorMix26DegTests

open JapanTaxLaw.LiquorMix26Deg
open JapanTaxLaw.LiquorMix26DegSpec

example : hasMix26Deg 0 = false := by decide
example : hasMix26Deg 25 = false := by decide
example : hasMix26Deg 26 = true := by decide
example : hasMix26Deg 27 = true := by decide
example : specWithin 25 = false := by decide
example : specWithin 26 = true := by decide
example : specWithin 27 = true := by decide
example : agree 0 := agree_thm 0
example : agree 25 := agree_thm 25
example : agree 26 := agree_thm 26
example : agree 27 := agree_thm 27

end JapanTaxLaw.LiquorMix26DegTests
