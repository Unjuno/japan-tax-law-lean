import JapanTaxLaw.ReserveAccumulationOver50UpTo75

/-! # ReserveAccumulationOver50UpTo75 tests — (50%,75%] 境界 (law 332CO0000000043) -/

namespace JapanTaxLaw.ReserveAccumulationOver50UpTo75

example : inRange 0 = false := by decide
example : inRange 49 = false := by decide
example : inRange 50 = false := by decide
example : inRange 51 = true := by decide
example : inRange 74 = true := by decide
example : inRange 75 = true := by decide
example : inRange 76 = false := by decide
example : inRange 100 = false := by decide

end JapanTaxLaw.ReserveAccumulationOver50UpTo75
