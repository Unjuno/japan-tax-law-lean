import JapanTaxLaw.BatchExcept21f97785a0Spec

namespace JapanTaxLaw.BatchExcept21f97785a0

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept21f97785a0
