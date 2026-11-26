import JapanTaxLaw.BatchExceptb471b24c05Spec

namespace JapanTaxLaw.BatchExceptb471b24c05

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb471b24c05
