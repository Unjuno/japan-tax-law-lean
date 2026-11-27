import JapanTaxLaw.LocalTaxBracket695To900

/-! # LocalTaxBracket695To900 tests — 695万/900万境界 (law 325AC0000000226 / art.37の2) -/

namespace JapanTaxLaw.LocalTaxBracket695To900

example : inRange 0 = false := by decide
example : inRange 6_949_999 = false := by decide
example : inRange 6_950_000 = false := by decide
example : inRange 6_950_001 = true := by decide
example : inRange 8_999_999 = true := by decide
example : inRange 9_000_000 = true := by decide
example : inRange 9_000_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket695To900
