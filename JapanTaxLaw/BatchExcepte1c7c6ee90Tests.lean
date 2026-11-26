import JapanTaxLaw.BatchExcepte1c7c6ee90Spec

namespace JapanTaxLaw.BatchExcepte1c7c6ee90

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepte1c7c6ee90
