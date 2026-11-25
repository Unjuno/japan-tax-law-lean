import JapanTaxLaw.ArrearsChargeRounding

/-!
# ArrearsChargeRounding tests — 延滞金基礎税額 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
2千円未満は0、それ以外は千円未満切捨て。
-/

namespace JapanTaxLaw.ArrearsChargeRounding

example : baseTax 1999 = 0 := by decide
example : baseTax 2000 = 2000 := by decide
example : baseTax 12345 = 12000 := by decide

end JapanTaxLaw.ArrearsChargeRounding
