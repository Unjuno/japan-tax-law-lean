import JapanTaxLaw.LocalTaxFalseFilingFineCap500k

/-!
# LocalTaxFalseFilingFineCap500k tests — 50万円境界の検査
Pinned to law 325AC0000000226 / art. 22の2. zero / small / below / at / above 500000.
-/

namespace JapanTaxLaw.LocalTaxFalseFilingFineCap500k

example : withinCap 0 = true := by decide
example : withinCap 1 = true := by decide
example : withinCap 499999 = true := by decide
example : withinCap 500000 = true := by decide
example : withinCap 500001 = false := by decide
example : withinCap 1000000 = false := by decide

end JapanTaxLaw.LocalTaxFalseFilingFineCap500k
