import JapanTaxLaw.BatchEffective718729d101Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchEffective718729d101

example : offset = 0 := by rfl
example : effectiveDay 100 = 100 + 0 := by rfl
example : appliesAt 100 (100 + 0) = true := applies_on_effective_day 100
example : appliesAt 0 0 = true := applies_on_effective_day 0
example : appliesAt 100 (100 + 5) = decide (0 ≤ 5) := shift_invariant 100 5
example : appliesAt 100 (100 + 0) = decide (0 ≤ 0) := shift_invariant 100 0
example : specApplies 100 (100 + 0) = appliesAt 100 (100 + 0) := agree_spec_impl 100 (100 + 0)
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
example : specApplies 0 0 = appliesAt 0 0 := agree_spec_impl 0 0

end JapanTaxLaw.BatchEffective718729d101
