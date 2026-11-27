import JapanTaxLaw.DelinquencyCostNet

/-!
# DelinquencyCostNet tests — kernel-decided boundary examples
Pinned to law 329CO0000000051, revision 329CO0000000051_20260401_508CO0000000085, art. 22(1).
Unit: 円; three provider amounts.
-/

namespace JapanTaxLaw.DelinquencyCostNet

example : netMiscIncome 0 0 0 = 0 := by decide
example : netMiscIncome 1 0 0 = 1 := by decide
example : netMiscIncome 100 0 100 = 0 := by decide
example : netMiscIncome 100 40 60 = 80 := by decide
example : netMiscIncome 100 40 140 = 0 := by decide
example : netMiscIncome 100 40 200 = 0 := by decide

end JapanTaxLaw.DelinquencyCostNet
