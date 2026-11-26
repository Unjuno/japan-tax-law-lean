import JapanTaxLaw.LocalTaxReducedRate2or1

/-!
# LocalTaxReducedRate2or1 tests — 2%/1% の境界検査
Pinned to law 325AC0000000226 / art. 37.
-/

namespace JapanTaxLaw.LocalTaxReducedRate2or1

example : amount 0 false = 0 := by decide
example : amount 1 false = 0 := by decide
example : amount 99 false = 1 := by decide
example : amount 100 false = 2 := by decide
example : amount 100 true = 1 := by decide
example : amount 10_000 false = 200 := by decide
example : amount 10_000 true = 100 := by decide

end JapanTaxLaw.LocalTaxReducedRate2or1
