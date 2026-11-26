import JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding

/-!
# CabinetOrderLocalTaxOneYenRounding tests — 1円未満切捨て smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
整数円入力はそのまま（恒等）。
-/

namespace JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding

example : roundToYen 0 = 0 := by decide
example : roundToYen 1 = 1 := by decide
example : roundToYen 12345 = 12345 := by decide

end JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding
