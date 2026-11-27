import JapanTaxLaw.LocalTaxBracket900To1800

/-! # LocalTaxBracket900To1800 tests — 900万/1800万境界 (law 325AC0000000226 / art.37の2) -/

namespace JapanTaxLaw.LocalTaxBracket900To1800

example : inRange 0 = false := by decide
example : inRange 8_999_999 = false := by decide
example : inRange 9_000_000 = false := by decide
example : inRange 9_000_001 = true := by decide
example : inRange 17_999_999 = true := by decide
example : inRange 18_000_000 = true := by decide
example : inRange 18_000_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket900To1800
