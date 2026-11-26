import JapanTaxLaw.RndExcess0To12

/-!
# RndExcess0To12 tests — [0%, 12%] 境界のカーネル決定検査
Pinned to law `332AC0000000026` / art. 10.
-/

namespace JapanTaxLaw.RndExcess0To12

example : inRange 0 = true := by decide
example : inRange 1 = true := by decide
example : inRange 3 = true := by decide
example : inRange 11 = true := by decide
example : inRange 12 = true := by decide
example : inRange 13 = false := by decide
example : inRange 100 = false := by decide

end JapanTaxLaw.RndExcess0To12
