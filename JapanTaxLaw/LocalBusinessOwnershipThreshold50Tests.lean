import JapanTaxLaw.LocalBusinessOwnershipThreshold50

/-!
# LocalBusinessOwnershipThreshold50 tests — >50% の境界検査
Pinned to law 329M50000002023 / art. 3の13の3. zero / small / below / at / above 五十.
-/

namespace JapanTaxLaw.LocalBusinessOwnershipThreshold50

example : exceeds50 0 = false := by decide
example : exceeds50 1 = false := by decide
example : exceeds50 49 = false := by decide
example : exceeds50 50 = false := by decide
example : exceeds50 51 = true := by decide
example : exceeds50 99 = true := by decide
example : exceeds50 100 = true := by decide

end JapanTaxLaw.LocalBusinessOwnershipThreshold50
