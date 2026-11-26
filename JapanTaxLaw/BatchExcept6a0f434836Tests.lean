import JapanTaxLaw.BatchExcept6a0f434836Spec

namespace JapanTaxLaw.BatchExcept6a0f434836

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept6a0f434836
