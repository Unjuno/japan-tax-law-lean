import JapanTaxLaw.BatchExceptb0f5a7f774Spec

namespace JapanTaxLaw.BatchExceptb0f5a7f774

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb0f5a7f774
