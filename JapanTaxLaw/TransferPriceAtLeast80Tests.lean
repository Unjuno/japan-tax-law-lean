import JapanTaxLaw.TransferPriceAtLeast80

/-! # TransferPriceAtLeast80 tests — 80%境界 (law 332CO0000000043 / art.25の18の3) -/

namespace JapanTaxLaw.TransferPriceAtLeast80

example : atLeast 0 100 = false := by decide
example : atLeast 79 100 = false := by decide
example : atLeast 80 100 = true := by decide
example : atLeast 81 100 = true := by decide
example : threshold 1000 = 800 := by decide
example : atLeast 799 1000 = false := by decide
example : atLeast 800 1000 = true := by decide

end JapanTaxLaw.TransferPriceAtLeast80
