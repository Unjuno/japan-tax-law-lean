import JapanTaxLaw.FacilityCostAtLeast100M

/-! # tests — 1億円境界 (law 325CO0000000245 / art.16の2の8) -/

namespace JapanTaxLaw.FacilityCostAtLeast100M

example : atLeast100M 0 = false := by decide
example : atLeast100M 99_999_999 = false := by decide
example : atLeast100M 100_000_000 = true := by decide
example : atLeast100M 100_000_001 = true := by decide
example : thresholdYen = 100_000_000 := by decide

end JapanTaxLaw.FacilityCostAtLeast100M
