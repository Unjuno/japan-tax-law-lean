import JapanTaxLaw.LocalTaxRateCeiling2Percent

/-!
# LocalTaxRateCeiling2Percent tests — 2% 上限の境界検査
Pinned to law 325AC0000000226 / art. 51. zero / small / below / at / above 二.
-/

namespace JapanTaxLaw.LocalTaxRateCeiling2Percent

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 2 = true := by decide
example : withinCeiling 3 = false := by decide
example : withinCeiling 4 = false := by decide
example : withinCeiling 99 = false := by decide
example : withinCeiling 100 = false := by decide

end JapanTaxLaw.LocalTaxRateCeiling2Percent
