import JapanTaxLaw.RndExcessOver15

/-!
# RndExcessOver15 tests — 15%境界のカーネル決定検査
Pinned to law `332AC0000000026` / art. 10.
-/

namespace JapanTaxLaw.RndExcessOver15

example : exceeds15 0 = false := by decide
example : exceeds15 3 = false := by decide
example : exceeds15 12 = false := by decide
example : exceeds15 14 = false := by decide
example : exceeds15 15 = false := by decide
example : exceeds15 16 = true := by decide
example : exceeds15 100 = true := by decide

end JapanTaxLaw.RndExcessOver15
