import JapanTaxLaw.BatchExceptc5a0b02feaSpec

namespace JapanTaxLaw.BatchExceptc5a0b02fea

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptc5a0b02fea
