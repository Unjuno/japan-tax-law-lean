import JapanTaxLaw.BatchExcept7150c78ee5Spec

namespace JapanTaxLaw.BatchExcept7150c78ee5

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7150c78ee5
