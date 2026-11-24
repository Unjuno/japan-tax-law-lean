import JapanTaxLaw.Semiconductor210nmSpec

/-! Kernel-decided boundary examples: 0/209/210/211 nm. -/

namespace JapanTaxLaw.Semiconductor210nmTests

open JapanTaxLaw.Semiconductor210nm
open JapanTaxLaw.Semiconductor210nmSpec

example : exceedsPitch210 0 = false := by decide
example : exceedsPitch210 209 = false := by decide
example : exceedsPitch210 210 = false := by decide
example : exceedsPitch210 211 = true := by decide
example : specWithin 209 = false := by decide
example : specWithin 210 = false := by decide
example : specWithin 211 = true := by decide
example : agree 0 := agree_thm 0
example : agree 209 := agree_thm 209
example : agree 210 := agree_thm 210
example : agree 211 := agree_thm 211

end JapanTaxLaw.Semiconductor210nmTests
