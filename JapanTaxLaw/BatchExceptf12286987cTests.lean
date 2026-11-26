import JapanTaxLaw.BatchExceptf12286987cSpec

namespace JapanTaxLaw.BatchExceptf12286987c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf12286987c
