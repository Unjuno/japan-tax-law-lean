import JapanTaxLaw.BatchExcept6a860a8e24Spec

namespace JapanTaxLaw.BatchExcept6a860a8e24

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept6a860a8e24
