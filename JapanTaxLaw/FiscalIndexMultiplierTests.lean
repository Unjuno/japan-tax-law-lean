import JapanTaxLaw.FiscalIndexMultiplierSpec

/-! Regression tests — 0.47 / 0.63 / 0.78 band boundaries. -/

namespace JapanTaxLaw.FiscalIndexMultiplier

example : multiplier 46 = (1, 1) := by decide
example : multiplier 47 = (2, 3) := by decide
example : multiplier 62 = (2, 3) := by decide
example : multiplier 63 = (1, 3) := by decide
example : multiplier 77 = (1, 3) := by decide
example : multiplier 78 = (0, 1) := by decide

example : multiplier 55 = specMultiplier 55 := multiplier_agrees 55
example : (multiplier 55).2 > 0 := multiplier_denominator_pos 55

end JapanTaxLaw.FiscalIndexMultiplier
