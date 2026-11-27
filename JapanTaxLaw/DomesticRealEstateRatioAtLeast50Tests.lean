import JapanTaxLaw.DomesticRealEstateRatioAtLeast50

/-! # DomesticRealEstateRatioAtLeast50 tests — 50%境界 (law 337CO0000000227 / art.7) -/

namespace JapanTaxLaw.DomesticRealEstateRatioAtLeast50

example : atLeast50 0 = false := by decide
example : atLeast50 49 = false := by decide
example : atLeast50 50 = true := by decide
example : atLeast50 51 = true := by decide
example : atLeast50 100 = true := by decide

end JapanTaxLaw.DomesticRealEstateRatioAtLeast50
