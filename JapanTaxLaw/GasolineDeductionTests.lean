import JapanTaxLaw.GasolineDeduction

/-!
# GasolineDeduction tests — 揮発油税法施行令 art.2 smoke checks

Decidable smoke tests, pinned to law 332CO0000000057 /
revision 332CO0000000057_20250401_507CO0000000006.

境界: 1.35% (135/10000)、10倍誤り回避 (1000 -> 13 でない 130)、0、切り捨て。
有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.GasolineDeduction

example : deductionNum = 135 := by decide
example : deductionDen = 10000 := by decide
example : deduction 0 = 0 := by decide
example : deduction 10000 = 135 := by decide
example : deduction 1000 = 13 := by decide
example : deduction 100000 = 1350 := by decide
example : deduction 1 = 0 := by decide

end JapanTaxLaw.GasolineDeduction
