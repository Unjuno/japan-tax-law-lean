import JapanTaxLaw.LocalGrantBracket1000To5000

/-! # LocalGrantBracket1000To5000 tests — 千億/五千億境界 (law 325AC0000000226) -/

namespace JapanTaxLaw.LocalGrantBracket1000To5000

example : inBracket 0 = false := by decide
example : inBracket 999 = false := by decide
example : inBracket 1000 = false := by decide
example : inBracket 1001 = true := by decide
example : inBracket 3000 = true := by decide
example : inBracket 5000 = true := by decide
example : inBracket 5001 = false := by decide

end JapanTaxLaw.LocalGrantBracket1000To5000
