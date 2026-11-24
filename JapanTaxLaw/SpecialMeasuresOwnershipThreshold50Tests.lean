import JapanTaxLaw.SpecialMeasuresOwnershipThreshold50

/-!
# SpecialMeasuresOwnershipThreshold50 tests — >50% の境界検査
Pinned to law 332CO0000000043 / art. 19の3. zero / small / below / at / above 五十.
-/

namespace JapanTaxLaw.SpecialMeasuresOwnershipThreshold50

example : exceeds50 0 = false := by decide
example : exceeds50 1 = false := by decide
example : exceeds50 49 = false := by decide
example : exceeds50 50 = false := by decide
example : exceeds50 51 = true := by decide
example : exceeds50 99 = true := by decide
example : exceeds50 100 = true := by decide

end JapanTaxLaw.SpecialMeasuresOwnershipThreshold50
