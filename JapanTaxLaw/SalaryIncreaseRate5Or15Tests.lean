import JapanTaxLaw.SalaryIncreaseRate5Or15

/-! # SalaryIncreaseRate5Or15 tests — 5%/15% 分岐境界 (law 332AC0000000026 / art.10の5の4) -/

namespace JapanTaxLaw.SalaryIncreaseRate5Or15

example : threshold false = 5 := by decide
example : threshold true = 15 := by decide
example : qualifies 4 false = false := by decide
example : qualifies 5 false = true := by decide
example : qualifies 14 true = false := by decide
example : qualifies 15 true = true := by decide
example : qualifies 100 true = true := by decide

end JapanTaxLaw.SalaryIncreaseRate5Or15
