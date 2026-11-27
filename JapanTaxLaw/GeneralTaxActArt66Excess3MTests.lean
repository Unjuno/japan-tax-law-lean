import JapanTaxLaw.GeneralTaxActArt66Excess3M
import JapanTaxLaw.GeneralTaxActArt66Excess3MSpec

/-!
# GeneralTaxActArt66Excess3MTests — kernel-decided regression checks

国税通則法 art.66(3)(3) (三百万円を超える部分に相当する税額). The strict
threshold and the excess computation are checked at 2,999,999 / 3,000,000 /
3,000,001. Every assertion is kernel-decided; no finite grid is presented as a
universal proof.
-/

namespace JapanTaxLaw.GeneralTaxActArt66Excess3M

example : threshold = 3_000_000 := by decide
example : threshold = specThreshold := by decide
example : excessPortion 0 = 0 := by decide
example : excessPortion 2_999_999 = 0 := by decide
example : excessPortion 3_000_000 = 0 := by decide
example : excessPortion 3_000_001 = 1 := by decide
example : excessPortion 5_000_000 = 2_000_000 := by decide
example : specExcess 2_999_999 = 0 := by decide
example : specExcess 3_000_000 = 0 := by decide
example : specExcess 3_000_001 = 1 := by decide
example : specExcess 5_000_000 = 2_000_000 := by decide
example : agreeGeneralTaxActArt66Excess3M = true := by decide

end JapanTaxLaw.GeneralTaxActArt66Excess3M
