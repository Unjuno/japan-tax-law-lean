import JapanTaxLaw.LocalFloorArea40_240Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LocalFloorArea40_240Tests

open JapanTaxLaw.LocalFloorArea40_240
open JapanTaxLaw.LocalFloorArea40_240Spec

example : inBand 39 = false := by decide
example : inBand 40 = true := by decide
example : inBand 41 = true := by decide
example : inBand 239 = true := by decide
example : inBand 240 = true := by decide
example : inBand 241 = false := by decide
example : agree 40 := agree_thm 40
example : agree 240 := agree_thm 240

end JapanTaxLaw.LocalFloorArea40_240Tests
