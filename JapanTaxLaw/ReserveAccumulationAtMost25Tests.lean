import JapanTaxLaw.ReserveAccumulationAtMost25

/-! # ReserveAccumulationAtMost25 tests — 25%境界 (law 332CO0000000043 / art.33の3) -/

namespace JapanTaxLaw.ReserveAccumulationAtMost25

example : atMost25 0 = true := by decide
example : atMost25 24 = true := by decide
example : atMost25 25 = true := by decide
example : atMost25 26 = false := by decide
example : atMost25 50 = false := by decide
example : atMost25 100 = false := by decide

end JapanTaxLaw.ReserveAccumulationAtMost25
