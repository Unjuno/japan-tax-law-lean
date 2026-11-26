import JapanTaxLaw.BatchExcept5fa5f53485Spec

namespace JapanTaxLaw.BatchExcept5fa5f53485

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept5fa5f53485
