import JapanTaxLaw.BranchDeputyAppointment
import JapanTaxLaw.BranchDeputyAppointmentSpec

/-
# BranchDeputyAppointmentTests — kernel-decided boundary + agreement checks

All checks are kernel-decided (`rfl` / `by decide`) or closed theorem-as-proof
bridges. Boundary categories registered with literals {1}: zero (0 input),
small_input (1/2/3), threshold_below (0), threshold_at (1), threshold_above (2),
plus saturation. The delegation flag is a Bool, not a numeric threshold.
-/

namespace JapanTaxLaw.BranchDeputyAppointment

-- deputyCount 0 (zero designated branches)
example : deputyCount 0 = 0 := by rfl
-- deputyCount 1 (one designated branch; statutory per-branch count L = 1)
example : deputyCount 1 = 1 := by rfl
-- deputyCount 2 (one designated branch above L)
example : deputyCount 2 = 2 := by rfl
-- deputyCount 3
example : deputyCount 3 = 3 := by rfl
-- deputyCount 10
example : deputyCount 10 = 10 := by rfl

-- constants (per-branch one; ordinance delegation)
example : deputyPerBranch = 1 := by rfl
example : designationByOrdinance = true := by decide

-- impl/spec agreement (axiom-free rfl bridges, theorem-as-proof)
example : deputyPerBranch = specPerBranch := agreePerBranch
example : designationByOrdinance = specDelegated := agreeDelegated
example : deputyCount 2 = specDeputyCount 2 := agreeDeputyCount 2

-- independent spec side, kernel-decided
example : specDeputyCount 3 = 3 := by rfl

end JapanTaxLaw.BranchDeputyAppointment
