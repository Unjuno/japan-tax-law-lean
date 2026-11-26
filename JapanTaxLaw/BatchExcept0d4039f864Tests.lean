import JapanTaxLaw.BatchExcept0d4039f864Spec

namespace JapanTaxLaw.BatchExcept0d4039f864

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept0d4039f864
