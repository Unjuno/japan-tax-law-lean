import JapanTaxLaw.TobaccoTaxFixedAmount

/-!
# TobaccoTaxFixedAmount tests — 地方税法施行規則 art.16の4の4 smoke checks
Decidable smoke tests, pinned to law 329M50000002023 / revision 329M50000002023_20261101_507CO0000000013.
境界: 0、端数切り上げ（1→1000, 1001→2000）、分子 C×2、分母 0。有限領域の smoke。
-/

namespace JapanTaxLaw.TobaccoTaxFixedAmount

example : roundUpThousand 0 = 0 := by decide
example : roundUpThousand 1 = 1000 := by decide
example : roundUpThousand 1000 = 1000 := by decide
example : roundUpThousand 1001 = 2000 := by decide
example : numerator 5 = 10 := by decide
example : fixedAmount 100000 1000 10 = 2000 := by decide
example : fixedAmount 1000 300 1 = 1000 := by decide
example : fixedAmount 1000 0 10 = 0 := by decide
example : fixedAmount 0 10 5 = 0 := by decide

end JapanTaxLaw.TobaccoTaxFixedAmount
