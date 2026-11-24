import JapanTaxLaw.InheritanceTaxLateFilingFineCap500k

/-!
# InheritanceTaxLateFilingFineCap500k tests — 50万円境界の検査
Pinned to law 325AC0000000073 / art. 69. zero / small / below / at / above 500000.
-/

namespace JapanTaxLaw.InheritanceTaxLateFilingFineCap500k

example : withinCap 0 = true := by decide
example : withinCap 1 = true := by decide
example : withinCap 499999 = true := by decide
example : withinCap 500000 = true := by decide
example : withinCap 500001 = false := by decide
example : withinCap 1000000 = false := by decide

end JapanTaxLaw.InheritanceTaxLateFilingFineCap500k
