import JapanTaxLaw.LocalTruckTonnage40500Rate6300Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LocalTruckTonnage40500Rate6300Tests

open JapanTaxLaw.LocalTruckTonnage40500Rate6300
open JapanTaxLaw.LocalTruckTonnage40500Rate6300Spec

example : amount 0 = 40500 := by decide
example : amount 1 = 40500 := by decide
example : amount 7 = 40500 := by decide
example : amount 8 = 40500 := by decide
example : amount 9 = 46800 := by decide
example : amount 6299 = 39673800 := by decide
example : amount 6300 = 39680100 := by decide
example : amount 6301 = 39686400 := by decide
example : agree 7 := agree_thm 7
example : agree 8 := agree_thm 8
example : agree 9 := agree_thm 9
example : agree 40500 := agree_thm 40500
example : agree 6300 := agree_thm 6300

end JapanTaxLaw.LocalTruckTonnage40500Rate6300Tests
