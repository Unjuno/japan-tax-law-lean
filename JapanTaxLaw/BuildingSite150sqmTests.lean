import JapanTaxLaw.BuildingSite150sqmSpec

/-! Kernel-decided boundary examples: 0/149/150/151 ㎡. -/

namespace JapanTaxLaw.BuildingSite150sqmTests

open JapanTaxLaw.BuildingSite150sqm
open JapanTaxLaw.BuildingSite150sqmSpec

example : hasSite150 0 = false := by decide
example : hasSite150 149 = false := by decide
example : hasSite150 150 = true := by decide
example : hasSite150 151 = true := by decide
example : specWithin 149 = false := by decide
example : specWithin 150 = true := by decide
example : specWithin 151 = true := by decide
example : agree 0 := agree_thm 0
example : agree 149 := agree_thm 149
example : agree 150 := agree_thm 150
example : agree 151 := agree_thm 151

end JapanTaxLaw.BuildingSite150sqmTests
