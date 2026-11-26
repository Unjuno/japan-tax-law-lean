import JapanTaxLaw.BatchExcept24f8d567e8Spec

namespace JapanTaxLaw.BatchExcept24f8d567e8

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept24f8d567e8
