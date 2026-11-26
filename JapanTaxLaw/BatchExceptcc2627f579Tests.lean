import JapanTaxLaw.BatchExceptcc2627f579Spec

namespace JapanTaxLaw.BatchExceptcc2627f579

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptcc2627f579
