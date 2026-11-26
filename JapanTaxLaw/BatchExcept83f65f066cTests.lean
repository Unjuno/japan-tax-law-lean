import JapanTaxLaw.BatchExcept83f65f066cSpec

namespace JapanTaxLaw.BatchExcept83f65f066c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept83f65f066c
