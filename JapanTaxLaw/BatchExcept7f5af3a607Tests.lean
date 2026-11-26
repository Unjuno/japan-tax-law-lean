import JapanTaxLaw.BatchExcept7f5af3a607Spec

namespace JapanTaxLaw.BatchExcept7f5af3a607

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7f5af3a607
