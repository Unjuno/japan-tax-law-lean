import JapanTaxLaw.LocalTaxBracketAtMost195

/-! # LocalTaxBracketAtMost195 tests — 195万境界 (law 325AC0000000226 / art.37の2) -/

namespace JapanTaxLaw.LocalTaxBracketAtMost195

example : atMost 0 = true := by decide
example : atMost 1_949_999 = true := by decide
example : atMost 1_950_000 = true := by decide
example : atMost 1_950_001 = false := by decide
example : atMost 9_000_000 = false := by decide

end JapanTaxLaw.LocalTaxBracketAtMost195
