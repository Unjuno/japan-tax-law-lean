import JapanTaxLaw.BatchCommence3755c51ff9Spec

namespace JapanTaxLaw.BatchCommence3755c51ff9

example : appliesAt 0 3 = true := applies_on_effective_day 0
example : appliesAt 100 (100 + 3) = true := applies_on_effective_day 100
example : appliesAt 100 (100 + 1) = decide (3 ≤ 1) := shift_invariant 100 1
example : specApplies 100 (100 + 3) = appliesAt 100 (100 + 3) := agree_spec_impl 100 (100 + 3)
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
end JapanTaxLaw.BatchCommence3755c51ff9
