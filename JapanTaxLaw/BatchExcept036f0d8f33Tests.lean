import JapanTaxLaw.BatchExcept036f0d8f33Spec

namespace JapanTaxLaw.BatchExcept036f0d8f33

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept036f0d8f33
