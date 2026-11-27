import JapanTaxLaw.ResidualPeriod10To15

/-! # ResidualPeriod10To15 tests — (10,15] 境界 (law 325AC0000000073 / art.23) -/

namespace JapanTaxLaw.ResidualPeriod10To15

example : inRange 0 = false := by decide
example : inRange 9 = false := by decide
example : inRange 10 = false := by decide
example : inRange 11 = true := by decide
example : inRange 14 = true := by decide
example : inRange 15 = true := by decide
example : inRange 16 = false := by decide

end JapanTaxLaw.ResidualPeriod10To15
