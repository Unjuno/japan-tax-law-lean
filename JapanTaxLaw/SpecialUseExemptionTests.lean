import JapanTaxLaw.SpecialUseExemption

/-!
# SpecialUseExemption tests — 特定用途 smoke checks
Decidable smoke tests, pinned to law 341CO0000000005 / revision 341CO0000000005_20250401_507CO0000000006.
原料用(0)・熱源用(1)→true、その他(2)→false。
-/

namespace JapanTaxLaw.SpecialUseExemption

example : isSpecifiedUse 0 = true := by decide
example : isSpecifiedUse 1 = true := by decide
example : isSpecifiedUse 2 = false := by decide
example : isSpecifiedUse 3 = false := by decide

end JapanTaxLaw.SpecialUseExemption
