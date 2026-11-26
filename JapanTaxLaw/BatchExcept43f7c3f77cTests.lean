import JapanTaxLaw.BatchExcept43f7c3f77cSpec

namespace JapanTaxLaw.BatchExcept43f7c3f77c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept43f7c3f77c
