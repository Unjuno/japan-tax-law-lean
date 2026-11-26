import JapanTaxLaw.BatchExcept3e2c69d043Spec

namespace JapanTaxLaw.BatchExcept3e2c69d043

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept3e2c69d043
