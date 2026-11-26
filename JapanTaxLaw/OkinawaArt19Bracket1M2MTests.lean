import JapanTaxLaw.OkinawaArt19Bracket1M2M
import JapanTaxLaw.OkinawaArt19Bracket1M2MSpec

/-!
# OkinawaArt19Bracket1M2MTests — kernel-decided regression checks

沖縄の復帰政令 art.19 (百万円以上二百万円未満の金額). Both boundaries are
checked: lower 1,000,000 inclusive, upper 2,000,000 exclusive. Every assertion
is kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket1M2M

example : lowerBound = 1_000_000 := by decide
example : upperBound = 2_000_000 := by decide
example : lowerBound = specLower := by decide
example : upperBound = specUpper := by decide
example : inBracket 0 = false := by decide
example : inBracket 999_999 = false := by decide
example : inBracket 1_000_000 = true := by decide
example : inBracket 1_999_999 = true := by decide
example : inBracket 2_000_000 = false := by decide
example : specInBracket 999_999 = false := by decide
example : specInBracket 1_000_000 = true := by decide
example : specInBracket 1_999_999 = true := by decide
example : specInBracket 2_000_000 = false := by decide
example : agreeOkinawaArt19Bracket1M2M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket1M2M
