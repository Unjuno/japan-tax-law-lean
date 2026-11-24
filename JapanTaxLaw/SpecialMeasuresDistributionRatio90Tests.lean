import JapanTaxLaw.SpecialMeasuresDistributionRatio90

/-!
# SpecialMeasuresDistributionRatio90 tests — >90% の境界検査
Pinned to law 332AC0000000026 / art. 68の3の3. zero / small / below / at / above 九十.
-/

namespace JapanTaxLaw.SpecialMeasuresDistributionRatio90

example : exceeds90 0 = false := by decide
example : exceeds90 1 = false := by decide
example : exceeds90 89 = false := by decide
example : exceeds90 90 = false := by decide
example : exceeds90 91 = true := by decide
example : exceeds90 99 = true := by decide
example : exceeds90 100 = true := by decide

end JapanTaxLaw.SpecialMeasuresDistributionRatio90
