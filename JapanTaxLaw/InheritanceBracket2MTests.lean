import JapanTaxLaw.InheritanceBracket2M
import JapanTaxLaw.InheritanceBracket2MSpec

/-!
# InheritanceBracket2MTests — kernel-decided regression checks

相続税法 art. 21の7 (二百万円以下の金額, inclusive). Boundaries
1,999,999 / 2,000,000 / 2,000,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.InheritanceBracket2M

example : bracketCap = 2_000_000 := by decide
example : bracketCap = specCap := by decide
example : inBracket 0 = true := by decide
example : inBracket 1_999_999 = true := by decide
example : inBracket 2_000_000 = true := by decide
example : inBracket 2_000_001 = false := by decide
example : specInBracket 1_999_999 = true := by decide
example : specInBracket 2_000_000 = true := by decide
example : specInBracket 2_000_001 = false := by decide
example : agreeInheritanceBracket2M = true := by decide

end JapanTaxLaw.InheritanceBracket2M
