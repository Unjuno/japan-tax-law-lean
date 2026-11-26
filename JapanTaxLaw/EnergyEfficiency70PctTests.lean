import JapanTaxLaw.EnergyEfficiency70Pct

/-! # EnergyEfficiency70Pct tests — 70%境界 (law 332AC0000000026 / art.90の12) -/

namespace JapanTaxLaw.EnergyEfficiency70Pct

example : meets 0 100 = false := by decide
example : meets 69 100 = false := by decide
example : meets 70 100 = true := by decide
example : meets 71 100 = true := by decide
example : threshold 1000 = 700 := by decide
example : meets 699 1000 = false := by decide
example : meets 700 1000 = true := by decide

end JapanTaxLaw.EnergyEfficiency70Pct
