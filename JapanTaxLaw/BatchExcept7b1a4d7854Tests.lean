import JapanTaxLaw.BatchExcept7b1a4d7854Spec

namespace JapanTaxLaw.BatchExcept7b1a4d7854

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7b1a4d7854
