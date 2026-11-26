import JapanTaxLaw.ForestRateAtLeast85

/-! # ForestRateAtLeast85 tests — 85%境界 (law 431M60000008040 / art.1の3) -/

namespace JapanTaxLaw.ForestRateAtLeast85

example : atLeast85 0 = false := by decide
example : atLeast85 84 = false := by decide
example : atLeast85 85 = true := by decide
example : atLeast85 86 = true := by decide
example : atLeast85 100 = true := by decide

end JapanTaxLaw.ForestRateAtLeast85
