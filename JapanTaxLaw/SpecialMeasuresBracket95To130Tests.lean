import JapanTaxLaw.SpecialMeasuresBracket95To130

/-! # tests — [95万,130万) 境界 (law 332AC0000000026 / art.5) -/

namespace JapanTaxLaw.SpecialMeasuresBracket95To130

example : inRange 0 = false := by decide
example : inRange 949_999 = false := by decide
example : inRange 950_000 = true := by decide
example : inRange 1_299_999 = true := by decide
example : inRange 1_300_000 = false := by decide
example : lowerYen = 950_000 := by decide
example : upperYen = 1_300_000 := by decide

end JapanTaxLaw.SpecialMeasuresBracket95To130
