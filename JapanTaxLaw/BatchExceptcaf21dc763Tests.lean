import JapanTaxLaw.BatchExceptcaf21dc763Spec

namespace JapanTaxLaw.BatchExceptcaf21dc763

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptcaf21dc763
