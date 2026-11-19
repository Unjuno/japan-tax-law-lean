import JapanTaxLaw.TonnageTax

/-!
# TonnageTax tests — とん税法 art.3 smoke checks

Decidable smoke tests, pinned to law 332AC0000000037 /
revision 332AC0000000037_20250601_504AC0000000068.

境界: 0 トン、端数なし/あり（「一トンまでごとに」切り上げ）、16/48 円の別。
有限領域の smoke であり普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.TonnageTax

example : entryRate = 16 := by decide
example : annualRate = 48 := by decide
example : tonCeil 10 0 = 10 := by decide
example : tonCeil 10 1 = 11 := by decide
example : entryTax 0 0 = 0 := by decide
example : entryTax 1 0 = 16 := by decide
example : entryTax 10 0 = 160 := by decide
example : entryTax 10 1 = 176 := by decide
example : annualTax 10 0 = 480 := by decide
example : annualTax 10 1 = 528 := by decide

end JapanTaxLaw.TonnageTax
