import JapanTaxLaw.BatchExceptbc71a81011Spec

namespace JapanTaxLaw.BatchExceptbc71a81011

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptbc71a81011
