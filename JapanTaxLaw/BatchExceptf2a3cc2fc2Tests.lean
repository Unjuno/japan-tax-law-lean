import JapanTaxLaw.BatchExceptf2a3cc2fc2Spec

namespace JapanTaxLaw.BatchExceptf2a3cc2fc2

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf2a3cc2fc2
