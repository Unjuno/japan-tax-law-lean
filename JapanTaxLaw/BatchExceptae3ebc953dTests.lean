import JapanTaxLaw.BatchExceptae3ebc953dSpec

namespace JapanTaxLaw.BatchExceptae3ebc953d

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptae3ebc953d
