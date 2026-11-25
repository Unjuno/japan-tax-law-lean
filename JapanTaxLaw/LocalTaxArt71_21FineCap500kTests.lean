import JapanTaxLaw.LocalTaxArt71_21FineCap500k

/-!
# LocalTaxArt71_21FineCap500k tests — 50万円境界の検査
Pinned to law 325AC0000000226 / art. 71の21.
-/

namespace JapanTaxLaw.LocalTaxArt71_21FineCap500k

example : withinCap 0 = true := by decide
example : withinCap 1 = true := by decide
example : withinCap 499999 = true := by decide
example : withinCap 500000 = true := by decide
example : withinCap 500001 = false := by decide
example : withinCap 1000000 = false := by decide

end JapanTaxLaw.LocalTaxArt71_21FineCap500k
