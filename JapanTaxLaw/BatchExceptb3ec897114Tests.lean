import JapanTaxLaw.BatchExceptb3ec897114Spec

namespace JapanTaxLaw.BatchExceptb3ec897114

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb3ec897114
