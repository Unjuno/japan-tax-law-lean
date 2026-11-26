import JapanTaxLaw.BatchExcept133f8c2f31Spec

namespace JapanTaxLaw.BatchExcept133f8c2f31

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept133f8c2f31
