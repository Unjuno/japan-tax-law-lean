import JapanTaxLaw.BatchExceptf271d7c851Spec

namespace JapanTaxLaw.BatchExceptf271d7c851

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf271d7c851
