import JapanTaxLaw.LocalTaxIncomeBracket4MTo1B

/-! # LocalTaxIncomeBracket4MTo1B tests — 四百万/十億境界 (law 325AC0000000226) -/

namespace JapanTaxLaw.LocalTaxIncomeBracket4MTo1B

example : inBracket 0 = false := by decide
example : inBracket 3_999_999 = false := by decide
example : inBracket 4_000_000 = false := by decide
example : inBracket 4_000_001 = true := by decide
example : inBracket 1_000_000_000 = true := by decide
example : inBracket 1_000_000_001 = false := by decide

end JapanTaxLaw.LocalTaxIncomeBracket4MTo1B
