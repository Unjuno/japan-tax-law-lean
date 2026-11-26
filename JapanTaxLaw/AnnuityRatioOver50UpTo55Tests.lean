import JapanTaxLaw.AnnuityRatioOver50UpTo55

/-! # AnnuityRatioOver50UpTo55 tests — (50%,55%] 境界 (law 340CO0000000096 / art.185) -/

namespace JapanTaxLaw.AnnuityRatioOver50UpTo55

example : inRange 0 = false := by decide
example : inRange 49 = false := by decide
example : inRange 50 = false := by decide
example : inRange 51 = true := by decide
example : inRange 54 = true := by decide
example : inRange 55 = true := by decide
example : inRange 56 = false := by decide
example : inRange 100 = false := by decide

end JapanTaxLaw.AnnuityRatioOver50UpTo55
