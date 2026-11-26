import JapanTaxLaw.BatchExceptab8d2af66fSpec

namespace JapanTaxLaw.BatchExceptab8d2af66f

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptab8d2af66f
