import JapanTaxLaw.BatchExcept00e2148b49Spec

namespace JapanTaxLaw.BatchExcept00e2148b49

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept00e2148b49
