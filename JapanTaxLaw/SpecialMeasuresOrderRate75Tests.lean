import JapanTaxLaw.SpecialMeasuresOrderRate75

/-!
# SpecialMeasuresOrderRate75 tests — 75% の境界検査
Pinned to law 332CO0000000043 / art. 5の5. zero / small / below / at / above 七十五.
-/

namespace JapanTaxLaw.SpecialMeasuresOrderRate75

example : delegatedAmount 0 = 0 := by decide
example : delegatedAmount 1 = 0 := by decide
example : delegatedAmount 74 = 55 := by decide
example : delegatedAmount 75 = 56 := by decide
example : delegatedAmount 76 = 57 := by decide
example : delegatedAmount 99 = 74 := by decide
example : delegatedAmount 100 = 75 := by decide
example : delegatedAmount 101 = 75 := by decide

end JapanTaxLaw.SpecialMeasuresOrderRate75
