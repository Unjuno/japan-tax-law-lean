import JapanTaxLaw.NationalTaxSmallBracket500k
import JapanTaxLaw.NationalTaxSmallBracket500kSpec

/-!
# NationalTaxSmallBracket500kTests — kernel-decided regression checks

国税通則法 art. 66(3)第一号 (五十万円以下の部分に相当する税額, inclusive).
Boundaries 499,999 / 500,000 / 500,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.NationalTaxSmallBracket500k

example : bracketCap = 500_000 := by decide
example : bracketCap = specCap := by decide
example : inSmallBracket 0 = true := by decide
example : inSmallBracket 499_999 = true := by decide
example : inSmallBracket 500_000 = true := by decide
example : inSmallBracket 500_001 = false := by decide
example : specInSmallBracket 499_999 = true := by decide
example : specInSmallBracket 500_000 = true := by decide
example : specInSmallBracket 500_001 = false := by decide
example : agreeNationalTaxSmallBracket500k = true := by decide

end JapanTaxLaw.NationalTaxSmallBracket500k
