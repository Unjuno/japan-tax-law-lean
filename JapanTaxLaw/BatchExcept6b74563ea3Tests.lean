import JapanTaxLaw.BatchExcept6b74563ea3Spec

namespace JapanTaxLaw.BatchExcept6b74563ea3

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept6b74563ea3
