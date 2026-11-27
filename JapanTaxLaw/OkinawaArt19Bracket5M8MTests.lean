import JapanTaxLaw.OkinawaArt19Bracket5M8M
import JapanTaxLaw.OkinawaArt19Bracket5M8MSpec

/-!
# OkinawaArt19Bracket5M8MTests — kernel-decided regression checks

沖縄の復帰政令 art.19 (五百万円以上八百万円未満の金額). Both boundaries are
checked: lower 5,000,000 inclusive, upper 8,000,000 exclusive. Every assertion
is kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket5M8M

example : lowerBound = 5_000_000 := by decide
example : upperBound = 8_000_000 := by decide
example : lowerBound = specLower := by decide
example : upperBound = specUpper := by decide
example : inBracket 0 = false := by decide
example : inBracket 4_999_999 = false := by decide
example : inBracket 5_000_000 = true := by decide
example : inBracket 7_999_999 = true := by decide
example : inBracket 8_000_000 = false := by decide
example : specInBracket 4_999_999 = false := by decide
example : specInBracket 5_000_000 = true := by decide
example : specInBracket 7_999_999 = true := by decide
example : specInBracket 8_000_000 = false := by decide
example : agreeOkinawaArt19Bracket5M8M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket5M8M
