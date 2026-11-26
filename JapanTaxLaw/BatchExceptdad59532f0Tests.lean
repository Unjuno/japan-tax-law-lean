import JapanTaxLaw.BatchExceptdad59532f0Spec

namespace JapanTaxLaw.BatchExceptdad59532f0

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptdad59532f0
