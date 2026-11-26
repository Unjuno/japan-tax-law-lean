import JapanTaxLaw.TriggerPriceGapOver75Percent

/-! # TriggerPriceGapOver75Percent tests — 75%境界 (law 335AC0000000036 / art.7の4) -/

namespace JapanTaxLaw.TriggerPriceGapOver75Percent

example : exceeds 0 100 = false := by decide
example : exceeds 74 100 = false := by decide
example : exceeds 75 100 = false := by decide
example : exceeds 76 100 = true := by decide
example : threshold 1000 = 750 := by decide
example : exceeds 750 1000 = false := by decide
example : exceeds 751 1000 = true := by decide

end JapanTaxLaw.TriggerPriceGapOver75Percent
