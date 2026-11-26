import JapanTaxLaw.BatchExcept7a6d2fd478Spec

namespace JapanTaxLaw.BatchExcept7a6d2fd478

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7a6d2fd478
