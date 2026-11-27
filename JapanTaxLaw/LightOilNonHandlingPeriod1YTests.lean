import JapanTaxLaw.LightOilNonHandlingPeriod1Y

/-! # LightOilNonHandlingPeriod1Y tests — 1年境界 (law 325CO0000000245 / art.43の8) -/

namespace JapanTaxLaw.LightOilNonHandlingPeriod1Y

example : atLeast1 0 = false := by decide
example : atLeast1 1 = true := by decide
example : atLeast1 2 = true := by decide
example : atLeast1 12 = true := by decide

end JapanTaxLaw.LightOilNonHandlingPeriod1Y
