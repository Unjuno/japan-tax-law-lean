import JapanTaxLaw.AverageImportOver30Percent

/-! # AverageImportOver30Percent tests — 30%境界 (law 335AC0000000036 / art.7の3) -/

namespace JapanTaxLaw.AverageImportOver30Percent

example : exceeds 0 100 = false := by decide
example : exceeds 29 100 = false := by decide
example : exceeds 30 100 = false := by decide
example : exceeds 31 100 = true := by decide
example : threshold 1000 = 300 := by decide
example : exceeds 300 1000 = false := by decide
example : exceeds 301 1000 = true := by decide

end JapanTaxLaw.AverageImportOver30Percent
