import JapanTaxLaw.CustomsSmallBracket500k
import JapanTaxLaw.CustomsSmallBracket500kSpec

/-!
# CustomsSmallBracket500kTests — kernel-decided regression checks

関税法 art. 12の3(3)第一号 (五十万円以下の部分に相当する税額, inclusive).
Boundaries 499,999 / 500,000 / 500,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.CustomsSmallBracket500k

example : bracketCap = 500_000 := by decide
example : bracketCap = specCap := by decide
example : inSmallBracket 0 = true := by decide
example : inSmallBracket 499_999 = true := by decide
example : inSmallBracket 500_000 = true := by decide
example : inSmallBracket 500_001 = false := by decide
example : specInSmallBracket 499_999 = true := by decide
example : specInSmallBracket 500_000 = true := by decide
example : specInSmallBracket 500_001 = false := by decide
example : agreeCustomsSmallBracket500k = true := by decide

end JapanTaxLaw.CustomsSmallBracket500k
