import JapanTaxLaw.BatchExcept7ef6bded03Spec

namespace JapanTaxLaw.BatchExcept7ef6bded03

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7ef6bded03
