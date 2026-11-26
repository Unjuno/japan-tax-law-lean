import JapanTaxLaw.OkinawaArt19Bracket600k1M
import JapanTaxLaw.OkinawaArt19Bracket600k1MSpec

/-!
# OkinawaArt19Bracket600k1MTests — kernel-decided regression checks

沖縄の復帰政令 art.19 (六十万円以上百万円未満の金額). Both boundaries are
checked: lower 600,000 inclusive, upper 1,000,000 exclusive. Every assertion
is kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket600k1M

example : lowerBound = 600_000 := by decide
example : upperBound = 1_000_000 := by decide
example : lowerBound = specLower := by decide
example : upperBound = specUpper := by decide
example : inBracket 0 = false := by decide
example : inBracket 599_999 = false := by decide
example : inBracket 600_000 = true := by decide
example : inBracket 999_999 = true := by decide
example : inBracket 1_000_000 = false := by decide
example : specInBracket 599_999 = false := by decide
example : specInBracket 600_000 = true := by decide
example : specInBracket 999_999 = true := by decide
example : specInBracket 1_000_000 = false := by decide
example : agreeOkinawaArt19Bracket600k1M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket600k1M
