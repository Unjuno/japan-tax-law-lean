import JapanTaxLaw.PropertyAcquisitionSpecialRate3

/-!
# PropertyAcquisitionSpecialRate3 tests — 3% の境界検査
Pinned to law 325AC0000000226 / 附則 art. 11の2. zero / small / below / at / above 三.
-/

namespace JapanTaxLaw.PropertyAcquisitionSpecialRate3

example : specialTax 0 = 0 := by decide
example : specialTax 1 = 0 := by decide
example : specialTax 2 = 0 := by decide
example : specialTax 3 = 0 := by decide
example : specialTax 4 = 0 := by decide
example : specialTax 99 = 2 := by decide
example : specialTax 100 = 3 := by decide
example : specialTax 101 = 3 := by decide

end JapanTaxLaw.PropertyAcquisitionSpecialRate3
