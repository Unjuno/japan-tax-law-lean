import JapanTaxLaw.BatchExcept85b81e3c55Spec

namespace JapanTaxLaw.BatchExcept85b81e3c55

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept85b81e3c55
