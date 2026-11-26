import JapanTaxLaw.BatchExceptb5f5ddda8fSpec

namespace JapanTaxLaw.BatchExceptb5f5ddda8f

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb5f5ddda8f
