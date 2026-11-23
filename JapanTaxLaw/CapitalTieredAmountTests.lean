import JapanTaxLaw.CapitalTieredAmountSpec

/-
Kernel-decided boundary examples for 第一条 (three-tier capital-to-amount mapping).
Contract: capital = 資本金の額等 (Nat, 円); requiredAmount = 要件額 (Nat, 円).
The bracket boundaries 50,000,000 and 100,000,000 are inclusive at their upper
bounds: exactly 50M stays in the base tier, exactly 100M stays in the mid tier.
-/

namespace JapanTaxLaw.CapitalTieredAmountTests

open JapanTaxLaw.CapitalTieredAmount
open JapanTaxLaw.CapitalTieredAmountSpec

-- zero / small_input: base tier
example : requiredAmount 0 = 5000000 := by decide
example : requiredAmount 1 = 5000000 := by decide

-- threshold_below (50,000,000 - 1): still the base tier
example : requiredAmount 49999999 = 5000000 := by decide

-- threshold_at (50,000,000): 五千万円以下 → base tier (inclusive)
example : requiredAmount 50000000 = 5000000 := by decide

-- threshold_above (50,000,000 + 1): 五千万円超 → mid tier
example : requiredAmount 50000001 = 10000000 := by decide

-- threshold_below (100,000,000 - 1): mid tier
example : requiredAmount 99999999 = 10000000 := by decide

-- threshold_at (100,000,000): 一億円以下 → mid tier (inclusive)
example : requiredAmount 100000000 = 10000000 := by decide

-- threshold_above (100,000,000 + 1): 一億円超 → high tier
example : requiredAmount 100000001 = 20000000 := by decide

-- well above the high boundary: still the high tier
example : requiredAmount 200000000 = 20000000 := by decide

-- independent spec agrees at the same boundary points
example : specRequired 0 = 5000000 := by decide
example : specRequired 50000000 = 5000000 := by decide
example : specRequired 50000001 = 10000000 := by decide
example : specRequired 100000000 = 10000000 := by decide
example : specRequired 100000001 = 20000000 := by decide

-- impl/spec agreement bridged by the universal kernel theorem
example : requiredAmount 0 = specRequired 0 := agreeRequired 0
example : requiredAmount 50000000 = specRequired 50000000 := agreeRequired 50000000
example : requiredAmount 50000001 = specRequired 50000001 := agreeRequired 50000001
example : requiredAmount 100000000 = specRequired 100000000 := agreeRequired 100000000
example : requiredAmount 100000001 = specRequired 100000001 := agreeRequired 100000001

end JapanTaxLaw.CapitalTieredAmountTests
