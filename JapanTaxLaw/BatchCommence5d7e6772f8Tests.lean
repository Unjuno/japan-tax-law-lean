import JapanTaxLaw.BatchCommence5d7e6772f8Spec

namespace JapanTaxLaw.BatchCommence5d7e6772f8

example : appliesAt 0 6 = true := applies_on_effective_day 0
example : appliesAt 100 (100 + 6) = true := applies_on_effective_day 100
example : appliesAt 100 (100 + 1) = decide (6 ≤ 1) := shift_invariant 100 1
example : specApplies 100 (100 + 6) = appliesAt 100 (100 + 6) := agree_spec_impl 100 (100 + 6)
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
end JapanTaxLaw.BatchCommence5d7e6772f8
