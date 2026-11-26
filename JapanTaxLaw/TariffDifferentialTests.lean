import JapanTaxLaw.TariffDifferentialSpec

/-! Regression tests — differential band boundaries and universal agreement. -/

namespace JapanTaxLaw.TariffDifferential

example : differential 475 490 = 15 := by decide
example : differential 490 490 = 0 := by decide
example : differential 491 490 = 0 := by decide

example : differential 485 500 = specDifferential 485 500 := differential_agrees 485 500
example : differential 165 170 = specDifferential 165 170 := differential_agrees 165 170

end JapanTaxLaw.TariffDifferential
