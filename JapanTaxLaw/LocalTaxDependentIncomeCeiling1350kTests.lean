import JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k

/-!
# LocalTaxDependentIncomeCeiling1350k tests — 135万円境界の検査
Pinned to law 325AC0000000226 / art. 24の5. zero / small / below / at / above 1350000.
-/

namespace JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 1349999 = true := by decide
example : withinCeiling 1350000 = true := by decide
example : withinCeiling 1350001 = false := by decide
example : withinCeiling 2000000 = false := by decide

end JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k
