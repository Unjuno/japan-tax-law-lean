import JapanTaxLaw.BatchExceptc29f50c292Spec

namespace JapanTaxLaw.BatchExceptc29f50c292

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptc29f50c292
