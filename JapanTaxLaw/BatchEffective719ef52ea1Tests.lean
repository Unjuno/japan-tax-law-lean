import JapanTaxLaw.BatchEffective719ef52ea1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchEffective719ef52ea1

example : offset = 1 := by rfl
example : effectiveDay 100 = 100 + 1 := by rfl
example : appliesAt 100 (100 + 1) = true := applies_on_effective_day 100
example : appliesAt 0 1 = true := applies_on_effective_day 0
example : appliesAt 100 (100 + 5) = decide (1 ≤ 5) := shift_invariant 100 5
example : appliesAt 100 (100 + 0) = decide (1 ≤ 0) := shift_invariant 100 0
example : specApplies 100 (100 + 1) = appliesAt 100 (100 + 1) := agree_spec_impl 100 (100 + 1)
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
example : specApplies 0 0 = appliesAt 0 0 := agree_spec_impl 0 0

end JapanTaxLaw.BatchEffective719ef52ea1
