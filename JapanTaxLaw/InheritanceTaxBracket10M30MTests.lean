import JapanTaxLaw.InheritanceTaxBracket10M30M
import JapanTaxLaw.InheritanceTaxBracket10M30MSpec

/-!
# InheritanceTaxBracket10M30MTests — kernel-decided regression checks

相続税法 art. 16 (千万円を超え三千万円以下の金額). Both boundaries are
checked: lower 10,000,000 exclusive, upper 30,000,000 inclusive. Every
assertion is kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.InheritanceTaxBracket10M30M

example : lowerBound = 10_000_000 := by decide
example : upperBound = 30_000_000 := by decide
example : lowerBound = specLower := by decide
example : upperBound = specUpper := by decide
example : inBracket 0 = false := by decide
example : inBracket 10_000_000 = false := by decide
example : inBracket 10_000_001 = true := by decide
example : inBracket 30_000_000 = true := by decide
example : inBracket 30_000_001 = false := by decide
example : specInBracket 10_000_000 = false := by decide
example : specInBracket 10_000_001 = true := by decide
example : specInBracket 30_000_000 = true := by decide
example : specInBracket 30_000_001 = false := by decide
example : agreeInheritanceTaxBracket10M30M = true := by decide

end JapanTaxLaw.InheritanceTaxBracket10M30M
