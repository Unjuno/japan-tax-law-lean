import JapanTaxLaw.LocalCapitalCeiling10M

/-!
# LocalCapitalCeiling10M tests — 1000万円境界の検査
Pinned to law 325AC0000000226 / art. 52 ホ. zero / small / below / at / above 10000000.
-/

namespace JapanTaxLaw.LocalCapitalCeiling10M

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 9999999 = true := by decide
example : withinCeiling 10000000 = true := by decide
example : withinCeiling 10000001 = false := by decide
example : withinCeiling 20000000 = false := by decide

end JapanTaxLaw.LocalCapitalCeiling10M
