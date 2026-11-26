import JapanTaxLaw.CityPlanningTaxRateCeiling03

/-! # CityPlanningTaxRateCeiling03 tests — 0.3%境界 (law 325AC0000000226 / art.702の4) -/

namespace JapanTaxLaw.CityPlanningTaxRateCeiling03

example : withinCeiling 0 = true := by decide
example : withinCeiling 2 = true := by decide
example : withinCeiling 3 = true := by decide
example : withinCeiling 4 = false := by decide
example : withinCeiling 100 = false := by decide

end JapanTaxLaw.CityPlanningTaxRateCeiling03
