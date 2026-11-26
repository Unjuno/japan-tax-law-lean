import JapanTaxLaw.BatchExceptcda423f314Spec

namespace JapanTaxLaw.BatchExceptcda423f314

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptcda423f314
