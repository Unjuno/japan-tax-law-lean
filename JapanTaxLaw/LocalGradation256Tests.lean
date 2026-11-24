import JapanTaxLaw.LocalGradation256Spec

/-! Kernel-decided boundary examples: 0/255/256/257 階調. -/

namespace JapanTaxLaw.LocalGradation256Tests

open JapanTaxLaw.LocalGradation256
open JapanTaxLaw.LocalGradation256Spec

example : hasGradation256 0 = false := by decide
example : hasGradation256 255 = false := by decide
example : hasGradation256 256 = true := by decide
example : hasGradation256 257 = true := by decide
example : specWithin 255 = false := by decide
example : specWithin 256 = true := by decide
example : specWithin 257 = true := by decide
example : agree 0 := agree_thm 0
example : agree 255 := agree_thm 255
example : agree 256 := agree_thm 256
example : agree 257 := agree_thm 257

end JapanTaxLaw.LocalGradation256Tests
