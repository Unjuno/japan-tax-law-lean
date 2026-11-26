import JapanTaxLaw.EnergyEfficiency105Pct

/-! # EnergyEfficiency105Pct tests — 105%境界 (law 332AC0000000026 / art.90の12) -/

namespace JapanTaxLaw.EnergyEfficiency105Pct

example : meets 0 100 = false := by decide
example : meets 104 100 = false := by decide
example : meets 105 100 = true := by decide
example : meets 106 100 = true := by decide
example : threshold 1000 = 1050 := by decide
example : meets 1049 1000 = false := by decide
example : meets 1050 1000 = true := by decide

end JapanTaxLaw.EnergyEfficiency105Pct
