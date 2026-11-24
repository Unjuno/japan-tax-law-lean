import JapanTaxLaw.UrbanPlanningTaxCapSpec

/-! Regression tests — 地方税法 702条の4 (都市計画税 0.3% ceiling). -/

namespace JapanTaxLaw.UrbanPlanningTaxCap

example : maxPerMille = 3 := by decide
example : withinCap 0 = true := by decide
example : withinCap 1 = true := by decide
example : withinCap 2 = true := by decide
example : withinCap 3 = true := by decide
example : withinCap 4 = false := by decide
example : withinCap 100 = false := by decide

example : (withinCap 3 = true) ↔ specWithinCap 3 := agreeWithinCap 3
example : (withinCap 4 = true) ↔ specWithinCap 4 := agreeWithinCap 4
example : specWithinCap 3 := boundaryAtCap
example : ¬ specWithinCap 4 := boundaryAboveCap

end JapanTaxLaw.UrbanPlanningTaxCap
