import JapanTaxLaw.BatchExceptae12f72655Spec

namespace JapanTaxLaw.BatchExceptae12f72655

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptae12f72655
