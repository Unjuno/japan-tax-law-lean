import JapanTaxLaw.LocalTaxOffenseFineCap500k

/-!
# LocalTaxOffenseFineCap500k tests — 50万円境界の検査
Pinned to law 325AC0000000226 / art. 27. zero / small / below / at / above 500000.
-/

namespace JapanTaxLaw.LocalTaxOffenseFineCap500k

example : withinCap 0 = true := by decide
example : withinCap 1 = true := by decide
example : withinCap 499999 = true := by decide
example : withinCap 500000 = true := by decide
example : withinCap 500001 = false := by decide
example : withinCap 1000000 = false := by decide

end JapanTaxLaw.LocalTaxOffenseFineCap500k
