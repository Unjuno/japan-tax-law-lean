import JapanTaxLaw.BatchExceptd70a3e50f2Spec

namespace JapanTaxLaw.BatchExceptd70a3e50f2

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd70a3e50f2
