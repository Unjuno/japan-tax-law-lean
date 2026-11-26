import JapanTaxLaw.CustomsExcessPortion3M
import JapanTaxLaw.CustomsExcessPortion3MSpec

/-!
# CustomsExcessPortion3MTests — kernel-decided regression checks

関税法 art. 12の3(3)第三号 (三百万円を超える部分に相当する税額, strict).
Boundaries 2,999,999 / 3,000,000 / 3,000,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.CustomsExcessPortion3M

example : excessThreshold = 3_000_000 := by decide
example : excessThreshold = specThreshold := by decide
example : isExcess 0 = false := by decide
example : isExcess 2_999_999 = false := by decide
example : isExcess 3_000_000 = false := by decide
example : isExcess 3_000_001 = true := by decide
example : specIsExcess 2_999_999 = false := by decide
example : specIsExcess 3_000_000 = false := by decide
example : specIsExcess 3_000_001 = true := by decide
example : agreeCustomsExcessPortion3M = true := by decide

end JapanTaxLaw.CustomsExcessPortion3M
