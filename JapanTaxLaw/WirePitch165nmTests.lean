import JapanTaxLaw.WirePitch165nmSpec

/-! Kernel-decided boundary examples: 0/164/165/166 nm. -/

namespace JapanTaxLaw.WirePitch165nmTests

open JapanTaxLaw.WirePitch165nm
open JapanTaxLaw.WirePitch165nmSpec

example : withinPitch165 0 = true := by decide
example : withinPitch165 164 = true := by decide
example : withinPitch165 165 = true := by decide
example : withinPitch165 166 = false := by decide
example : specWithin 164 = true := by decide
example : specWithin 165 = true := by decide
example : specWithin 166 = false := by decide
example : agree 0 := agree_thm 0
example : agree 164 := agree_thm 164
example : agree 165 := agree_thm 165
example : agree 166 := agree_thm 166

end JapanTaxLaw.WirePitch165nmTests
