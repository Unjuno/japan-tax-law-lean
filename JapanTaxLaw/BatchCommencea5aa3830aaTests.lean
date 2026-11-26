import JapanTaxLaw.BatchCommencea5aa3830aaSpec

namespace JapanTaxLaw.BatchCommencea5aa3830aa

example : appliesAt 0 2 = true := applies_on_effective_day 0
example : appliesAt 100 (100 + 2) = true := applies_on_effective_day 100
example : appliesAt 100 (100 + 1) = decide (2 ≤ 1) := shift_invariant 100 1
example : specApplies 100 (100 + 2) = appliesAt 100 (100 + 2) := agree_spec_impl 100 (100 + 2)
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
end JapanTaxLaw.BatchCommencea5aa3830aa
