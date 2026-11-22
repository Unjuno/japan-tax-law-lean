import JapanTaxLaw.LiquorDegreeSteppedAmountSpec

/-
Kernel-decided boundary examples for 酒税法 第二十三条 (stepped additive amount).
Contract: degrees = アルコール分 (Nat, 度); 200000 円 base; +10000 円 per degree
above 20 when degree >= 21 (inclusive at 21).
-/

namespace JapanTaxLaw.LiquorDegreeSteppedAmountTests

open JapanTaxLaw.LiquorDegreeSteppedAmount
open JapanTaxLaw.LiquorDegreeSteppedAmountSpec

-- zero / small inputs (below the 二十度 floor): flat base
example : feeFor 0 = 200000 := by decide
example : feeFor 1 = 200000 := by decide
example : feeFor 5 = 200000 := by decide
example : feeFor 19 = 200000 := by decide

-- threshold_below (二十度を超える: 20 is strictly below the 21 qualifying degree)
example : feeFor 20 = 200000 := by decide

-- threshold_at (二十一度以上: inclusive 21) and threshold_above
example : feeFor 21 = 210000 := by decide
example : feeFor 22 = 220000 := by decide
example : feeFor 30 = 300000 := by decide

-- independent spec agrees at the same boundary points
example : specFee 0 = 200000 := by decide
example : specFee 20 = 200000 := by decide
example : specFee 21 = 210000 := by decide
example : specFee 22 = 220000 := by decide
example : specFee 30 = 300000 := by decide

-- impl/spec agreement bridged by the universal kernel theorem
example : feeFor 0 = specFee 0 := agreeFee 0
example : feeFor 20 = specFee 20 := agreeFee 20
example : feeFor 21 = specFee 21 := agreeFee 21
example : feeFor 22 = specFee 22 := agreeFee 22
example : feeFor 30 = specFee 30 := agreeFee 30

end JapanTaxLaw.LiquorDegreeSteppedAmountTests
