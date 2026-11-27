import JapanTaxLaw.EnergyEfficiency173Pct

/-! # EnergyEfficiency173Pct tests — 173%境界 (law 332CO0000000043 / art.51の2) -/

namespace JapanTaxLaw.EnergyEfficiency173Pct

example : meets 0 100 = false := by decide
example : meets 172 100 = false := by decide
example : meets 173 100 = true := by decide
example : meets 174 100 = true := by decide
example : threshold 1000 = 1730 := by decide
example : meets 1729 1000 = false := by decide
example : meets 1730 1000 = true := by decide

end JapanTaxLaw.EnergyEfficiency173Pct
