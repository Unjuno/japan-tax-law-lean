import JapanTaxLaw.EnergyEfficiency75Pct

/-! # EnergyEfficiency75Pct tests — 75%境界 (law 332AC0000000026 / art.90の12) -/

namespace JapanTaxLaw.EnergyEfficiency75Pct

example : meets 0 100 = false := by decide
example : meets 74 100 = false := by decide
example : meets 75 100 = true := by decide
example : meets 76 100 = true := by decide
example : threshold 1000 = 750 := by decide
example : meets 749 1000 = false := by decide
example : meets 750 1000 = true := by decide

end JapanTaxLaw.EnergyEfficiency75Pct
