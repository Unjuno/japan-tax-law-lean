import JapanTaxLaw.OkinawaArt19Bracket20M
import JapanTaxLaw.OkinawaArt19Bracket20MSpec

/-!
# OkinawaArt19Bracket20MTests — kernel-decided regression checks

沖縄の復帰政令 art.19 (二千万円以上の金額, inclusive). Boundaries
19,999,999 / 20,000,000 / 20,000,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket20M

example : bracketFloor = 20_000_000 := by decide
example : bracketFloor = specFloor := by decide
example : inTopBracket 0 = false := by decide
example : inTopBracket 19_999_999 = false := by decide
example : inTopBracket 20_000_000 = true := by decide
example : inTopBracket 20_000_001 = true := by decide
example : specInTopBracket 19_999_999 = false := by decide
example : specInTopBracket 20_000_000 = true := by decide
example : specInTopBracket 20_000_001 = true := by decide
example : agreeOkinawaArt19Bracket20M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket20M
