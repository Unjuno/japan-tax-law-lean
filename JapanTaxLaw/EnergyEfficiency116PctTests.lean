import JapanTaxLaw.EnergyEfficiency116Pct

/-! # EnergyEfficiency116Pct tests — 116%境界 (law 332CO0000000043 / art.51の2) -/

namespace JapanTaxLaw.EnergyEfficiency116Pct

example : meets 0 100 = false := by decide
example : meets 115 100 = false := by decide
example : meets 116 100 = true := by decide
example : meets 117 100 = true := by decide
example : threshold 1000 = 1160 := by decide
example : meets 1159 1000 = false := by decide
example : meets 1160 1000 = true := by decide

end JapanTaxLaw.EnergyEfficiency116Pct
