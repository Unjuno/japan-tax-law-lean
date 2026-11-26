import JapanTaxLaw.RndExcessOver12

/-!
# RndExcessOver12 tests — 12%境界のカーネル決定検査
Pinned to law `332AC0000000026` / art. 10.
-/

namespace JapanTaxLaw.RndExcessOver12

example : exceeds12 0 = false := by decide
example : exceeds12 3 = false := by decide
example : exceeds12 11 = false := by decide
example : exceeds12 12 = false := by decide
example : exceeds12 13 = true := by decide
example : exceeds12 15 = true := by decide
example : exceeds12 100 = true := by decide

end JapanTaxLaw.RndExcessOver12
