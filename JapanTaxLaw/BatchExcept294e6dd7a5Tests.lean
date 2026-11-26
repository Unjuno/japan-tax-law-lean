import JapanTaxLaw.BatchExcept294e6dd7a5Spec

namespace JapanTaxLaw.BatchExcept294e6dd7a5

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept294e6dd7a5
