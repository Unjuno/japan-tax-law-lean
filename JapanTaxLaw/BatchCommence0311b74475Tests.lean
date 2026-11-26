import JapanTaxLaw.BatchCommence0311b74475Spec

namespace JapanTaxLaw.BatchCommence0311b74475

example : appliesAt 0 1 = true := applies_on_effective_day 0
example : appliesAt 100 (100 + 1) = true := applies_on_effective_day 100
example : appliesAt 100 (100 + 1) = decide (1 ≤ 1) := shift_invariant 100 1
example : specApplies 100 (100 + 1) = appliesAt 100 (100 + 1) := agree_spec_impl 100 (100 + 1)
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
end JapanTaxLaw.BatchCommence0311b74475
