import JapanTaxLaw.BatchExcept76bc39a0a6Spec

namespace JapanTaxLaw.BatchExcept76bc39a0a6

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept76bc39a0a6
