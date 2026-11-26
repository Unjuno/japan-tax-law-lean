import JapanTaxLaw.BatchExcept62b9086e35Spec

namespace JapanTaxLaw.BatchExcept62b9086e35

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept62b9086e35
