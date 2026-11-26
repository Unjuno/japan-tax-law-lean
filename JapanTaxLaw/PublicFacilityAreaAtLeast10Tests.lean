import JapanTaxLaw.PublicFacilityAreaAtLeast10

/-! # PublicFacilityAreaAtLeast10 tests — 10%境界 (law 332CO0000000043 / art.43の2) -/

namespace JapanTaxLaw.PublicFacilityAreaAtLeast10

example : atLeast10 0 = false := by decide
example : atLeast10 9 = false := by decide
example : atLeast10 10 = true := by decide
example : atLeast10 11 = true := by decide
example : atLeast10 50 = true := by decide
example : atLeast10 100 = true := by decide

end JapanTaxLaw.PublicFacilityAreaAtLeast10
