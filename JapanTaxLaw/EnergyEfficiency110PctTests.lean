import JapanTaxLaw.EnergyEfficiency110Pct

/-! # EnergyEfficiency110Pct tests — 110%境界 (law 332CO0000000043 / art.51の2) -/

namespace JapanTaxLaw.EnergyEfficiency110Pct

example : meets 0 100 = false := by decide
example : meets 109 100 = false := by decide
example : meets 110 100 = true := by decide
example : meets 111 100 = true := by decide
example : threshold 1000 = 1100 := by decide
example : meets 1099 1000 = false := by decide
example : meets 1100 1000 = true := by decide

end JapanTaxLaw.EnergyEfficiency110Pct
