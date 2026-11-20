import JapanTaxLaw.TaxSavingsPenaltyCeilingSpec

/-!
# TaxSavingsPenaltyCeilingTests — kernel-checked boundary checks for art.14

All checks are `by decide` (after unfolding) / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.TaxSavingsPenaltyCeiling

open JapanTaxLaw.TaxFinance

example : penaltyCeilingYen = 100_000 := rfl
example : withinPenaltyCeiling 0 := by
  unfold withinPenaltyCeiling penaltyCeilingYen; decide
example : withinPenaltyCeiling 99_999 := by
  unfold withinPenaltyCeiling penaltyCeilingYen; decide
example : withinPenaltyCeiling 100_000 := by
  unfold withinPenaltyCeiling penaltyCeilingYen; decide
example : ¬ withinPenaltyCeiling 100_001 := by
  unfold withinPenaltyCeiling penaltyCeilingYen; decide
example : withinPenaltyCeiling 100_000 ↔ specWithinPenaltyCeiling 100_000 :=
  agree_penalty_ceiling 100_000
example : withinPenaltyCeiling penaltyCeilingYen := at_ceiling
example : ¬ withinPenaltyCeiling (penaltyCeilingYen + 1) := one_over_fails
example : checkPenaltyCeiling 100_000 = true := by decide
example : checkPenaltyCeiling 100_001 = false := by decide

end JapanTaxLaw.TaxSavingsPenaltyCeiling
