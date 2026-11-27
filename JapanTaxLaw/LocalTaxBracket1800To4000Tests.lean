import JapanTaxLaw.LocalTaxBracket1800To4000

/-! # LocalTaxBracket1800To4000 tests — 1800万/4000万境界 (law 325AC0000000226 / art.37の2) -/

namespace JapanTaxLaw.LocalTaxBracket1800To4000

example : inRange 0 = false := by decide
example : inRange 17_999_999 = false := by decide
example : inRange 18_000_000 = false := by decide
example : inRange 18_000_001 = true := by decide
example : inRange 39_999_999 = true := by decide
example : inRange 40_000_000 = true := by decide
example : inRange 40_000_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket1800To4000
