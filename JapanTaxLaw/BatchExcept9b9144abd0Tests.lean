import JapanTaxLaw.BatchExcept9b9144abd0Spec

namespace JapanTaxLaw.BatchExcept9b9144abd0

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept9b9144abd0
