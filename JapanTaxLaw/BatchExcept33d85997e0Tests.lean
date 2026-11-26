import JapanTaxLaw.BatchExcept33d85997e0Spec

namespace JapanTaxLaw.BatchExcept33d85997e0

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept33d85997e0
