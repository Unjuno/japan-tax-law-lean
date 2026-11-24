import JapanTaxLaw.LongTermGainSpecialMeasure

/-!
# LongTermGainSpecialMeasure tests — 長期譲渡所得特例 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
(課税長期譲渡所得−2000万)×2%（指定都市1%）。
-/

namespace JapanTaxLaw.LongTermGainSpecialMeasure

example : measure 30000000 false = 200000 := by decide
example : measure 30000000 true = 100000 := by decide
example : measure 10000000 false = 0 := by decide

end JapanTaxLaw.LongTermGainSpecialMeasure
