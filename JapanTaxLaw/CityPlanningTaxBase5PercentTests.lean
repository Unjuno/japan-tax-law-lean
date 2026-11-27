import JapanTaxLaw.CityPlanningTaxBase5Percent

/-! # CityPlanningTaxBase5Percent tests — 5%算定 (law 325CO0000000245 / art.15) -/

namespace JapanTaxLaw.CityPlanningTaxBase5Percent

example : amount 0 = 0 := by decide
example : amount 1 = 0 := by decide
example : amount 99 = 4 := by decide
example : amount 100 = 5 := by decide
example : amount 101 = 5 := by decide
example : amount 1_000 = 50 := by decide
example : amount 10_001 = 500 := by decide

end JapanTaxLaw.CityPlanningTaxBase5Percent
