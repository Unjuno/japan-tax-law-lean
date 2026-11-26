import JapanTaxLaw.BatchExceptd67e8c6d93Spec

namespace JapanTaxLaw.BatchExceptd67e8c6d93

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd67e8c6d93
