import JapanTaxLaw.LocalFloorArea50_240Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LocalFloorArea50_240Tests

open JapanTaxLaw.LocalFloorArea50_240
open JapanTaxLaw.LocalFloorArea50_240Spec

example : inBand 49 = false := by decide
example : inBand 50 = true := by decide
example : inBand 51 = true := by decide
example : inBand 239 = true := by decide
example : inBand 240 = true := by decide
example : inBand 241 = false := by decide
example : agree 50 := agree_thm 50
example : agree 240 := agree_thm 240

end JapanTaxLaw.LocalFloorArea50_240Tests
