import JapanTaxLaw.InheritanceTaxEvasionFineCap10M

/-!
# InheritanceTaxEvasionFineCap10M tests — 1000万円境界の検査
Pinned to law 325AC0000000073 / art. 68. zero / small / below / at / above 10000000.
-/

namespace JapanTaxLaw.InheritanceTaxEvasionFineCap10M

example : withinCap 0 = true := by decide
example : withinCap 1 = true := by decide
example : withinCap 9999999 = true := by decide
example : withinCap 10000000 = true := by decide
example : withinCap 10000001 = false := by decide
example : withinCap 20000000 = false := by decide

end JapanTaxLaw.InheritanceTaxEvasionFineCap10M
