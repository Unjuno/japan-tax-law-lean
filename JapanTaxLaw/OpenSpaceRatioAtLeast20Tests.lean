import JapanTaxLaw.OpenSpaceRatioAtLeast20

/-! # OpenSpaceRatioAtLeast20 tests — 20%境界 (law 332CO0000000043 / art.22の8) -/

namespace JapanTaxLaw.OpenSpaceRatioAtLeast20

example : atLeast20 0 = false := by decide
example : atLeast20 19 = false := by decide
example : atLeast20 20 = true := by decide
example : atLeast20 21 = true := by decide
example : atLeast20 50 = true := by decide
example : atLeast20 100 = true := by decide

end JapanTaxLaw.OpenSpaceRatioAtLeast20
