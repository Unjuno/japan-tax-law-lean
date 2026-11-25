import JapanTaxLaw.LocalInhabitantReducedRate3or4

/-!
# LocalInhabitantReducedRate3or4 tests — 3%/4% の境界検査
Pinned to law 325AC0000000226 / art. 314の6.
-/

namespace JapanTaxLaw.LocalInhabitantReducedRate3or4

example : amount 0 false = 0 := by decide
example : amount 1 false = 0 := by decide
example : amount 99 false = 2 := by decide
example : amount 100 false = 3 := by decide
example : amount 100 true = 4 := by decide
example : amount 10_000 false = 300 := by decide
example : amount 10_000 true = 400 := by decide

end JapanTaxLaw.LocalInhabitantReducedRate3or4
