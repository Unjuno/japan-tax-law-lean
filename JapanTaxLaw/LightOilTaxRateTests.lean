import JapanTaxLaw.LightOilTaxRate

/-! Kernel-decided smoke checks. -/

namespace JapanTaxLaw.LightOilTaxRate

example : lightOilTaxRate = 15000 := by decide
example : lightOilTaxRate > 0 := by decide
example : lightOilTaxRate ≠ 150000 := by decide

end JapanTaxLaw.LightOilTaxRate
