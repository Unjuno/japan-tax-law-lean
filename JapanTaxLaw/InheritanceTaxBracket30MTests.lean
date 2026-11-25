import JapanTaxLaw.InheritanceTaxBracket30M
import JapanTaxLaw.InheritanceTaxBracket30MSpec

/-!
# InheritanceTaxBracket30MTests — kernel-decided regression checks

相続税法 art. 21の7 (三千万円を超える金額, strict). Boundaries
29,999,999 / 30,000,000 / 30,000,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.InheritanceTaxBracket30M

example : bracketThreshold = 30_000_000 := by decide
example : bracketThreshold = specThreshold := by decide
example : exceedsBracket 0 = false := by decide
example : exceedsBracket 29_999_999 = false := by decide
example : exceedsBracket 30_000_000 = false := by decide
example : exceedsBracket 30_000_001 = true := by decide
example : specExceeds 29_999_999 = false := by decide
example : specExceeds 30_000_000 = false := by decide
example : specExceeds 30_000_001 = true := by decide
example : agreeInheritanceTaxBracket30M = true := by decide

end JapanTaxLaw.InheritanceTaxBracket30M
