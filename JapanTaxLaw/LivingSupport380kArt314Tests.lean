import JapanTaxLaw.LivingSupport380kArt314Spec

/-! Kernel-decided boundary examples: 0/379999/380000/380001 円. -/

namespace JapanTaxLaw.LivingSupport380kArt314Tests

open JapanTaxLaw.LivingSupport380kArt314
open JapanTaxLaw.LivingSupport380kArt314Spec

example : hasSupport380k 0 = false := by decide
example : hasSupport380k 379999 = false := by decide
example : hasSupport380k 380000 = true := by decide
example : hasSupport380k 380001 = true := by decide
example : specWithin 379999 = false := by decide
example : specWithin 380000 = true := by decide
example : specWithin 380001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 379999 := agree_thm 379999
example : agree 380000 := agree_thm 380000
example : agree 380001 := agree_thm 380001

end JapanTaxLaw.LivingSupport380kArt314Tests
