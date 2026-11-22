import JapanTaxLaw.PermitValidity7DaysSpec

/-
Kernel-decided boundary examples for PermitValidity7Days (許可状の有効期間七日超, strict > 7).
Covers zero / small_input / threshold_below (6) / threshold_at (7) / threshold_above (8),
a large input (30), plus impl/spec agreement via the kernel-checked bridges.
-/

namespace JapanTaxLaw.PermitValidity7DaysTests

open JapanTaxLaw.PermitValidity7Days

-- (a) zero input does not require a special permit.
example : needsSpecialPermit 0 = false := by decide

-- (b) small positive input below the floor.
example : needsSpecialPermit 6 = false := by decide

-- (c) exactly at the floor: 超える is strict, so 七日 does not qualify.
example : needsSpecialPermit 7 = false := by decide

-- (d) one day above the floor qualifies.
example : needsSpecialPermit 8 = true := by decide

-- (e) large input above the floor.
example : needsSpecialPermit 30 = true := by decide

-- (f) pinned statutory value.
example : validityFloorDays = 7 := rfl

-- (g) independent spec constant.
example : specFloor = 7 := rfl

-- (h) kernel-decided impl/spec agreement at the boundary points.
example : needsSpecialPermit 0 = specNeeds 0 := by decide
example : needsSpecialPermit 6 = specNeeds 6 := by decide
example : needsSpecialPermit 7 = specNeeds 7 := by decide
example : needsSpecialPermit 8 = specNeeds 8 := by decide
example : needsSpecialPermit 30 = specNeeds 30 := by decide

-- (i) universal kernel-checked bridge theorems.
example : validityFloorDays = specFloor := agreeFloor
example (days : Nat) : needsSpecialPermit days = specNeeds days := agreeNeeds days

end JapanTaxLaw.PermitValidity7DaysTests
