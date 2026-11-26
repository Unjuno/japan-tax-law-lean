import JapanTaxLaw.LocalTaxStandardRateCeiling2

/-!
# LocalTaxStandardRateCeiling2 tests — 2%境界の検査
Pinned to law 325AC0000000226 / art. 51.
-/

namespace JapanTaxLaw.LocalTaxStandardRateCeiling2

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 2 = true := by decide
example : withinCeiling 3 = false := by decide
example : withinCeiling 4 = false := by decide
example : withinCeiling 100 = false := by decide

end JapanTaxLaw.LocalTaxStandardRateCeiling2
