import JapanTaxLaw.OkinawaArt19Bracket10M15M
import JapanTaxLaw.OkinawaArt19Bracket10M15MSpec

/-!
# OkinawaArt19Bracket10M15MTests — kernel-decided regression checks

沖縄の復帰政令 art.19 (千万円以上千五百万円未満の金額). Both boundaries are
checked: lower 10,000,000 inclusive, upper 15,000,000 exclusive. Every assertion
is kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket10M15M

example : lowerBound = 10_000_000 := by decide
example : upperBound = 15_000_000 := by decide
example : lowerBound = specLower := by decide
example : upperBound = specUpper := by decide
example : inBracket 0 = false := by decide
example : inBracket 9_999_999 = false := by decide
example : inBracket 10_000_000 = true := by decide
example : inBracket 14_999_999 = true := by decide
example : inBracket 15_000_000 = false := by decide
example : specInBracket 9_999_999 = false := by decide
example : specInBracket 10_000_000 = true := by decide
example : specInBracket 14_999_999 = true := by decide
example : specInBracket 15_000_000 = false := by decide
example : agreeOkinawaArt19Bracket10M15M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket10M15M
