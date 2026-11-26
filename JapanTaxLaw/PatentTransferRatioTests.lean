import JapanTaxLaw.PatentTransferRatio

/-!
# PatentTransferRatio tests — kernel-decided boundary examples
Pinned to law 332M50000040015, revision 332M50000040015_20261101_507M60000040026, art. 21_17_2(2).
Unit: amount / transaction count (provider inputs).
-/

namespace JapanTaxLaw.PatentTransferRatio

example : ratioAdjusted 0 0 = 0 := by decide
example : ratioAdjusted 1 0 = 0 := by decide
example : ratioAdjusted 100 1 = 0 := by decide
example : ratioAdjusted 100 2 = 50 := by decide
example : ratioAdjusted 100 3 = 66 := by decide
example : ratioAdjusted 100 4 = 75 := by decide

end JapanTaxLaw.PatentTransferRatio
