import JapanTaxLaw.LocalAllocationTaxEnforcementDateSpec

/-!
# LocalAllocationTaxEnforcementDateTests — kernel-checked boundary checks

All checks are `by decide` (after unfolding) / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalAllocationTaxEnforcementDate

example : maxDelayDays = 90 := rfl
example : withinEnforcementRange 0 0 := by
  unfold withinEnforcementRange maxDelayDays; decide
example : withinEnforcementRange 0 45 := by
  unfold withinEnforcementRange maxDelayDays; decide
example : withinEnforcementRange 0 90 := by
  unfold withinEnforcementRange maxDelayDays; decide
example : ¬ withinEnforcementRange 0 91 := by
  unfold withinEnforcementRange maxDelayDays; decide
example : ¬ withinEnforcementRange 10 9 := by
  unfold withinEnforcementRange; decide
example : withinEnforcementRange 10 100 := by
  unfold withinEnforcementRange maxDelayDays; decide
example : ¬ withinEnforcementRange 10 101 := by
  unfold withinEnforcementRange maxDelayDays; decide
example : withinEnforcementRange 0 0 ↔ specWithinEnforcementRange 0 0 :=
  agree_enforcement_range 0 0
example : withinEnforcementRange 0 90 ↔ specWithinEnforcementRange 0 90 :=
  agree_enforcement_range 0 90
example : withinEnforcementRange 0 0 := at_promulgation 0
example : withinEnforcementRange 0 (0 + 90) := at_max_delay 0
example : ¬ withinEnforcementRange 0 (0 + 91) := beyond_max_delay 0
example : ¬ withinEnforcementRange 10 9 := before_promulgation 10 9 (by decide)

end JapanTaxLaw.LocalAllocationTaxEnforcementDate
