import JapanTaxLaw.SpecialMeasuresBracket400k950k
import JapanTaxLaw.SpecialMeasuresBracket400k950kSpec

/-!
# SpecialMeasuresBracket400k950kTests — kernel-decided regression checks

租税特別措置法 art. 5 (四十万円以上九十五万円未満の金額). Both boundaries
checked: lower 400,000 inclusive, upper 950,000 exclusive. Every assertion
is kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.SpecialMeasuresBracket400k950k

example : lowerBound = 400_000 := by decide
example : upperBound = 950_000 := by decide
example : lowerBound = specLower := by decide
example : upperBound = specUpper := by decide
example : inBracket 0 = false := by decide
example : inBracket 399_999 = false := by decide
example : inBracket 400_000 = true := by decide
example : inBracket 949_999 = true := by decide
example : inBracket 950_000 = false := by decide
example : specInBracket 399_999 = false := by decide
example : specInBracket 400_000 = true := by decide
example : specInBracket 949_999 = true := by decide
example : specInBracket 950_000 = false := by decide
example : agreeSpecialMeasuresBracket400k950k = true := by decide

end JapanTaxLaw.SpecialMeasuresBracket400k950k
