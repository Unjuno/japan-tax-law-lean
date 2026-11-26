import JapanTaxLaw.BatchExceptbfca0174b1Spec

namespace JapanTaxLaw.BatchExceptbfca0174b1

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptbfca0174b1
