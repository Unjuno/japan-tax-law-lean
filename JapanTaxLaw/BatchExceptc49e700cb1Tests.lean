import JapanTaxLaw.BatchExceptc49e700cb1Spec

namespace JapanTaxLaw.BatchExceptc49e700cb1

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptc49e700cb1
