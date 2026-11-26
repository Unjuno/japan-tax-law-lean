import JapanTaxLaw.BatchExceptcf9c0bd018Spec

namespace JapanTaxLaw.BatchExceptcf9c0bd018

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptcf9c0bd018
