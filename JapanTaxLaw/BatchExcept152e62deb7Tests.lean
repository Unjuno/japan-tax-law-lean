import JapanTaxLaw.BatchExcept152e62deb7Spec

namespace JapanTaxLaw.BatchExcept152e62deb7

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept152e62deb7
