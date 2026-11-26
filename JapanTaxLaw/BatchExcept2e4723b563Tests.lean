import JapanTaxLaw.BatchExcept2e4723b563Spec

namespace JapanTaxLaw.BatchExcept2e4723b563

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept2e4723b563
