import JapanTaxLaw.GasolineTransferRounding

/-!
# GasolineTransferRounding tests — 地方揮発油譲与税法 art.5 smoke checks
Decidable smoke tests, pinned to law 330AC0000000113 / revision 330AC0000000113_20190401_431AC0000000002.
境界: 千円未満 0/999/1000/端数。有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.GasolineTransferRounding

example : transferAmount 0 = 0 := by decide
example : transferAmount 999 = 0 := by decide
example : transferAmount 1000 = 1000 := by decide
example : transferAmount 12_345 = 12_000 := by decide
example : transferAmount 12_999 = 12_000 := by decide
example : transferAmount 999_999 = 999_000 := by decide

end JapanTaxLaw.GasolineTransferRounding
