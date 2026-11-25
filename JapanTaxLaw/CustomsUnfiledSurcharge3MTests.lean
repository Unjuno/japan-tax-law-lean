import JapanTaxLaw.CustomsUnfiledSurcharge3M
import JapanTaxLaw.CustomsUnfiledSurcharge3MSpec

/-!
# CustomsUnfiledSurcharge3MTests — kernel-decided regression checks

関税法 art. 12の3(3) (加算後累積納付税額 三百万円超, strict; 百分の五 rate).
Boundaries 2,999,999 / 3,000,000 / 3,000,001 and the 5/100 rate ratio are
checked. Every assertion is kernel-decided; no finite grid is presented as
a universal proof.
-/

namespace JapanTaxLaw.CustomsUnfiledSurcharge3M

example : cumulativePaidThreshold = 3_000_000 := by decide
example : cumulativePaidThreshold = specThreshold := by decide
example : exceedsThreshold 0 = false := by decide
example : exceedsThreshold 2_999_999 = false := by decide
example : exceedsThreshold 3_000_000 = false := by decide
example : exceedsThreshold 3_000_001 = true := by decide
example : specExceeds 2_999_999 = false := by decide
example : specExceeds 3_000_000 = false := by decide
example : specExceeds 3_000_001 = true := by decide
example : reductionNumerator * 20 = reductionDenominator := by decide
example : reductionNumerator = specReductionNumerator := by decide
example : reductionDenominator = specReductionDenominator := by decide
example : agreeCustomsUnfiledSurcharge3M = true := by decide

end JapanTaxLaw.CustomsUnfiledSurcharge3M
