import JapanTaxLaw.BatchExcept075ece85fcSpec

namespace JapanTaxLaw.BatchExcept075ece85fc

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept075ece85fc
