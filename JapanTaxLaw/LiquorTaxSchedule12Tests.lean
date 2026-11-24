import JapanTaxLaw.LiquorTaxSchedule12Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LiquorTaxSchedule12Tests

open JapanTaxLaw.LiquorTaxSchedule12
open JapanTaxLaw.LiquorTaxSchedule12Spec

example : amount 11 = 120000 := by decide
example : agree 11 := agree_thm 11
example : amount 12 = 120000 := by decide
example : agree 12 := agree_thm 12
example : amount 13 = 130000 := by decide
example : agree 13 := agree_thm 13
example : amount 14 = 140000 := by decide
example : agree 14 := agree_thm 14

end JapanTaxLaw.LiquorTaxSchedule12Tests
