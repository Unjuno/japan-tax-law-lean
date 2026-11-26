import JapanTaxLaw.BatchExceptefc25806e6Spec

namespace JapanTaxLaw.BatchExceptefc25806e6

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptefc25806e6
