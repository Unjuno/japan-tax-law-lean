import JapanTaxLaw.LocalInterestTaxRate5

/-!
# LocalInterestTaxRate5 tests — 5% の境界検査

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
zero / small input / just-below / at / just-above the statutory numerator.
-/

namespace JapanTaxLaw.LocalInterestTaxRate5

example : interestShareTax 0 = 0 := by decide
example : interestShareTax 1 = 0 := by decide
example : interestShareTax 4 = 0 := by decide
example : interestShareTax 5 = 0 := by decide
example : interestShareTax 6 = 0 := by decide
example : interestShareTax 99 = 4 := by decide
example : interestShareTax 100 = 5 := by decide
example : interestShareTax 101 = 5 := by decide

end JapanTaxLaw.LocalInterestTaxRate5
