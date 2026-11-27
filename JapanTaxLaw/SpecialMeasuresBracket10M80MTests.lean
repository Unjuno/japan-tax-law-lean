import JapanTaxLaw.SpecialMeasuresBracket10M80M
import JapanTaxLaw.SpecialMeasuresBracket10M80MSpec

/-!
# SpecialMeasuresBracket10M80MTests — kernel-decided regression checks

租税特別措置法 art.5 附則 (千万円以上八千万円未満の金額). Both boundaries are
checked: lower 10,000,000 inclusive, upper 80,000,000 exclusive. Every assertion
is kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.SpecialMeasuresBracket10M80M

example : lowerBound = 10_000_000 := by decide
example : upperBound = 80_000_000 := by decide
example : lowerBound = specLower := by decide
example : upperBound = specUpper := by decide
example : inBracket 0 = false := by decide
example : inBracket 9_999_999 = false := by decide
example : inBracket 10_000_000 = true := by decide
example : inBracket 79_999_999 = true := by decide
example : inBracket 80_000_000 = false := by decide
example : specInBracket 9_999_999 = false := by decide
example : specInBracket 10_000_000 = true := by decide
example : specInBracket 79_999_999 = true := by decide
example : specInBracket 80_000_000 = false := by decide
example : agreeSpecialMeasuresBracket10M80M = true := by decide

end JapanTaxLaw.SpecialMeasuresBracket10M80M
