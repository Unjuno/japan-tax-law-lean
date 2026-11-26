import JapanTaxLaw.BatchExcept3476857e83Spec

namespace JapanTaxLaw.BatchExcept3476857e83

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept3476857e83
