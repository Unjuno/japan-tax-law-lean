import JapanTaxLaw.BatchExcept58ec8b4075Spec

namespace JapanTaxLaw.BatchExcept58ec8b4075

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept58ec8b4075
