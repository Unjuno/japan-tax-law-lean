import JapanTaxLaw.BatchExcept09d035df28Spec

namespace JapanTaxLaw.BatchExcept09d035df28

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept09d035df28
