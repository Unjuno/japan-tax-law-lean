import JapanTaxLaw.LocalTaxBracket330To695

/-! # LocalTaxBracket330To695 tests — 330万/695万境界 (law 325AC0000000226 / art.37の2) -/

namespace JapanTaxLaw.LocalTaxBracket330To695

example : inRange 0 = false := by decide
example : inRange 3_299_999 = false := by decide
example : inRange 3_300_000 = false := by decide
example : inRange 3_300_001 = true := by decide
example : inRange 6_949_999 = true := by decide
example : inRange 6_950_000 = true := by decide
example : inRange 6_950_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket330To695
