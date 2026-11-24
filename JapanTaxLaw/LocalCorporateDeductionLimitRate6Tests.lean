import JapanTaxLaw.LocalCorporateDeductionLimitRate6

/-!
# LocalCorporateDeductionLimitRate6 tests — 6% の境界検査
Pinned to law 325CO0000000245 / art. 48の13. zero / small / below / at / above 六.
-/

namespace JapanTaxLaw.LocalCorporateDeductionLimitRate6

example : corporateDeductionLimit 0 = 0 := by decide
example : corporateDeductionLimit 1 = 0 := by decide
example : corporateDeductionLimit 5 = 0 := by decide
example : corporateDeductionLimit 6 = 0 := by decide
example : corporateDeductionLimit 7 = 0 := by decide
example : corporateDeductionLimit 99 = 5 := by decide
example : corporateDeductionLimit 100 = 6 := by decide
example : corporateDeductionLimit 101 = 6 := by decide

end JapanTaxLaw.LocalCorporateDeductionLimitRate6
