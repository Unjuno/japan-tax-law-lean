import JapanTaxLaw.RndExcessAtMost3

/-!
# RndExcessAtMost3 tests — 3%境界のカーネル決定検査
Pinned to law `332AC0000000026` / art. 10.
-/

namespace JapanTaxLaw.RndExcessAtMost3

example : atMost3 0 = true := by decide
example : atMost3 1 = true := by decide
example : atMost3 2 = true := by decide
example : atMost3 3 = true := by decide
example : atMost3 4 = false := by decide
example : atMost3 12 = false := by decide
example : atMost3 100 = false := by decide

end JapanTaxLaw.RndExcessAtMost3
