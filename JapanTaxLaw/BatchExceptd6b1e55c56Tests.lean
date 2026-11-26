import JapanTaxLaw.BatchExceptd6b1e55c56Spec

namespace JapanTaxLaw.BatchExceptd6b1e55c56

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd6b1e55c56
