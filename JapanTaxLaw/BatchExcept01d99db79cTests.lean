import JapanTaxLaw.BatchExcept01d99db79cSpec

namespace JapanTaxLaw.BatchExcept01d99db79c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept01d99db79c
