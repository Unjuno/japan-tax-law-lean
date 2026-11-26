import JapanTaxLaw.BatchExcept9cbd48e145Spec

namespace JapanTaxLaw.BatchExcept9cbd48e145

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept9cbd48e145
