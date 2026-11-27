import JapanTaxLaw.SakeNonBrewingPeriod3Y

/-! # SakeNonBrewingPeriod3Y tests — 3年境界 (law 328AC0000000006 / art.12) -/

namespace JapanTaxLaw.SakeNonBrewingPeriod3Y

example : atLeast3 0 = false := by decide
example : atLeast3 1 = false := by decide
example : atLeast3 2 = false := by decide
example : atLeast3 3 = true := by decide
example : atLeast3 4 = true := by decide
example : atLeast3 12 = true := by decide

end JapanTaxLaw.SakeNonBrewingPeriod3Y
