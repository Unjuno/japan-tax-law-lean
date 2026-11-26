import JapanTaxLaw.BatchExceptbee3f09a69Spec

namespace JapanTaxLaw.BatchExceptbee3f09a69

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptbee3f09a69
