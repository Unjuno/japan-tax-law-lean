import JapanTaxLaw.BatchExcept5e03511296Spec

namespace JapanTaxLaw.BatchExcept5e03511296

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept5e03511296
