import JapanTaxLaw.AmamiCurrencyConversion

/-!
# AmamiCurrencyConversion tests — 奄美群島税法施行令 art.6 smoke checks

Decidable smoke tests, pinned to law 328CO0000000407 /
revision 328CO0000000407_19660331_341CO0000000078.

境界: 0、1、端数なし（3倍）。有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.AmamiCurrencyConversion

example : conversionFactor = 3 := by decide
example : convert 0 = 0 := by decide
example : convert 1 = 3 := by decide
example : convert 1000 = 3000 := by decide
example : convert 999_999 = 2_999_997 := by decide

end JapanTaxLaw.AmamiCurrencyConversion
