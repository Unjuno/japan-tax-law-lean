import JapanTaxLaw.LocalTaxBracketOver4000

/-! # LocalTaxBracketOver4000 tests — 4000万境界 (law 325AC0000000226 / art.37の2) -/

namespace JapanTaxLaw.LocalTaxBracketOver4000

example : over4000 0 = false := by decide
example : over4000 39_999_999 = false := by decide
example : over4000 40_000_000 = false := by decide
example : over4000 40_000_001 = true := by decide
example : over4000 100_000_000 = true := by decide

end JapanTaxLaw.LocalTaxBracketOver4000
