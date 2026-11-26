import JapanTaxLaw.BatchExceptf3cb545e30Spec

namespace JapanTaxLaw.BatchExceptf3cb545e30

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf3cb545e30
