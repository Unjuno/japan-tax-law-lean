import JapanTaxLaw.ConsumptionTaxRate10or8

/-! # ConsumptionTaxRate10or8 tests — 10%/8% 分岐 (law 363AC0000000108 / art.34) -/

namespace JapanTaxLaw.ConsumptionTaxRate10or8

example : rate false = 10 := by decide
example : rate true = 8 := by decide
example : rate true < rate false := by decide
example : rate false - rate true = 2 := by decide
example : rate true + 2 = rate false := by decide
example : rate false * 10 = 100 := by decide

end JapanTaxLaw.ConsumptionTaxRate10or8
