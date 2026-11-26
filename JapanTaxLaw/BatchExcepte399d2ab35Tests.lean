import JapanTaxLaw.BatchExcepte399d2ab35Spec

namespace JapanTaxLaw.BatchExcepte399d2ab35

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepte399d2ab35
