import JapanTaxLaw.RndExcessOver3

/-!
# RndExcessOver3 tests — 3%境界のカーネル決定検査
Pinned to law `332AC0000000026` / art. 10.
-/

namespace JapanTaxLaw.RndExcessOver3

example : exceeds3 0 = false := by decide
example : exceeds3 1 = false := by decide
example : exceeds3 2 = false := by decide
example : exceeds3 3 = false := by decide
example : exceeds3 4 = true := by decide
example : exceeds3 12 = true := by decide
example : exceeds3 100 = true := by decide

end JapanTaxLaw.RndExcessOver3
