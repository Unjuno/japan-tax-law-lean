import JapanTaxLaw.LocalTruckTonnage29500Rate4700Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LocalTruckTonnage29500Rate4700Tests

open JapanTaxLaw.LocalTruckTonnage29500Rate4700
open JapanTaxLaw.LocalTruckTonnage29500Rate4700Spec

example : amount 0 = 29500 := by decide
example : amount 1 = 29500 := by decide
example : amount 7 = 29500 := by decide
example : amount 8 = 29500 := by decide
example : amount 9 = 34200 := by decide
example : amount 4699 = 22077200 := by decide
example : amount 4700 = 22081900 := by decide
example : amount 4701 = 22086600 := by decide
example : agree 7 := agree_thm 7
example : agree 8 := agree_thm 8
example : agree 9 := agree_thm 9
example : agree 29500 := agree_thm 29500
example : agree 4700 := agree_thm 4700

end JapanTaxLaw.LocalTruckTonnage29500Rate4700Tests
