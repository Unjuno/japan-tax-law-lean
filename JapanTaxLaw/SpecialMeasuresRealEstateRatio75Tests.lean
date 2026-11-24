import JapanTaxLaw.SpecialMeasuresRealEstateRatio75

/-!
# SpecialMeasuresRealEstateRatio75 tests — ≥75% の境界検査
Pinned to law 332AC0000000026 / art. 83の2の2. zero / small / below / at / above 七十五.
-/

namespace JapanTaxLaw.SpecialMeasuresRealEstateRatio75

example : atLeast75 0 = false := by decide
example : atLeast75 1 = false := by decide
example : atLeast75 74 = false := by decide
example : atLeast75 75 = true := by decide
example : atLeast75 76 = true := by decide
example : atLeast75 99 = true := by decide
example : atLeast75 100 = true := by decide

end JapanTaxLaw.SpecialMeasuresRealEstateRatio75
