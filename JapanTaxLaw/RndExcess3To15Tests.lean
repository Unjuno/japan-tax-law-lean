import JapanTaxLaw.RndExcess3To15

/-!
# RndExcess3To15 tests — (3%, 15%] 境界のカーネル決定検査
Pinned to law `332AC0000000026` / art. 10.
-/

namespace JapanTaxLaw.RndExcess3To15

example : inRange 0 = false := by decide
example : inRange 2 = false := by decide
example : inRange 3 = false := by decide
example : inRange 4 = true := by decide
example : inRange 12 = true := by decide
example : inRange 14 = true := by decide
example : inRange 15 = true := by decide
example : inRange 16 = false := by decide
example : inRange 100 = false := by decide

end JapanTaxLaw.RndExcess3To15
