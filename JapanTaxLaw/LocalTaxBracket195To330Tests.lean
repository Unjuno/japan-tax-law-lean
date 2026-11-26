import JapanTaxLaw.LocalTaxBracket195To330

/-! # LocalTaxBracket195To330 tests — 195万/330万境界 (law 325AC0000000226 / art.37の2) -/

namespace JapanTaxLaw.LocalTaxBracket195To330

example : inRange 0 = false := by decide
example : inRange 1_949_999 = false := by decide
example : inRange 1_950_000 = false := by decide
example : inRange 1_950_001 = true := by decide
example : inRange 3_299_999 = true := by decide
example : inRange 3_300_000 = true := by decide
example : inRange 3_300_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket195To330
