import JapanTaxLaw.SpecialMeasures2MBracket
import JapanTaxLaw.SpecialMeasures2MBracketSpec

/-!
# SpecialMeasures2MBracketTests — kernel-decided regression checks

租税特別措置法 art. 70の2の5 (二百万円以下の金額, inclusive). Boundaries
1,999,999 / 2,000,000 / 2,000,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.SpecialMeasures2MBracket

example : bracketCap = 2_000_000 := by decide
example : bracketCap = specCap := by decide
example : inBracket 0 = true := by decide
example : inBracket 1_999_999 = true := by decide
example : inBracket 2_000_000 = true := by decide
example : inBracket 2_000_001 = false := by decide
example : specInBracket 1_999_999 = true := by decide
example : specInBracket 2_000_000 = true := by decide
example : specInBracket 2_000_001 = false := by decide
example : agreeSpecialMeasures2MBracket = true := by decide

end JapanTaxLaw.SpecialMeasures2MBracket
