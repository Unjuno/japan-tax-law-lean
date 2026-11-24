import JapanTaxLaw.LiquorTaxBand15to16Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.LiquorTaxBand15to16Tests

open JapanTaxLaw.LiquorTaxBand15to16
open JapanTaxLaw.LiquorTaxBand15to16Spec

example : inBand 14 = false := by decide
example : inBand 15 = true := by decide
example : inBand 15 = true := by decide
example : inBand 16 = false := by decide
example : agree 15 := agree_thm 15
example : agree 15 := agree_thm 15

end JapanTaxLaw.LiquorTaxBand15to16Tests
