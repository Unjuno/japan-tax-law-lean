import JapanTaxLaw.BatchExceptea9ca1cafeSpec

namespace JapanTaxLaw.BatchExceptea9ca1cafe

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptea9ca1cafe
