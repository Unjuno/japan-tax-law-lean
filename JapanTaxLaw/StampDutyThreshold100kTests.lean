import JapanTaxLaw.StampDutyThreshold100k
import JapanTaxLaw.StampDutyThreshold100kSpec

/-!
# StampDutyThreshold100kTests — kernel-decided regression checks

印紙税法 art. 4 (十万円を超える金額, strict). Boundaries
99,999 / 100,000 / 100,001 are checked. Every assertion is kernel-decided;
no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.StampDutyThreshold100k

example : threshold = 100_000 := by decide
example : threshold = specThreshold := by decide
example : exceedsThreshold 0 = false := by decide
example : exceedsThreshold 99_999 = false := by decide
example : exceedsThreshold 100_000 = false := by decide
example : exceedsThreshold 100_001 = true := by decide
example : specExceeds 99_999 = false := by decide
example : specExceeds 100_000 = false := by decide
example : specExceeds 100_001 = true := by decide
example : agreeStampDutyThreshold100k = true := by decide

end JapanTaxLaw.StampDutyThreshold100k
