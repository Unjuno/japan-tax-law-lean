import JapanTaxLaw.BatchExcept54c2d8c623Spec

namespace JapanTaxLaw.BatchExcept54c2d8c623

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept54c2d8c623
