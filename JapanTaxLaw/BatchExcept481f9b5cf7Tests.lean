import JapanTaxLaw.BatchExcept481f9b5cf7Spec

namespace JapanTaxLaw.BatchExcept481f9b5cf7

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept481f9b5cf7
