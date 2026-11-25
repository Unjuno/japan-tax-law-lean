import JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold

/-!
# InheritanceTaxOrderOwnership50Threshold tests — >50% の境界検査
Pinned to law 325CO0000000071 / art. 31. zero / small / below / at / above 五十.
-/

namespace JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold

example : exceeds50 0 = false := by decide
example : exceeds50 1 = false := by decide
example : exceeds50 49 = false := by decide
example : exceeds50 50 = false := by decide
example : exceeds50 51 = true := by decide
example : exceeds50 99 = true := by decide
example : exceeds50 100 = true := by decide

end JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold
