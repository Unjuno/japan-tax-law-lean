import JapanTaxLaw.TransferPriceAtMost120

/-! # TransferPriceAtMost120 tests — 120%境界 (law 332CO0000000043 / art.25の18の3) -/

namespace JapanTaxLaw.TransferPriceAtMost120

example : within 0 100 = true := by decide
example : within 119 100 = true := by decide
example : within 120 100 = true := by decide
example : within 121 100 = false := by decide
example : threshold 1000 = 1200 := by decide
example : within 1200 1000 = true := by decide
example : within 1201 1000 = false := by decide

end JapanTaxLaw.TransferPriceAtMost120
