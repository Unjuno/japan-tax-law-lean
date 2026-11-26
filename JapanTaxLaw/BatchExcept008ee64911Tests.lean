import JapanTaxLaw.BatchExcept008ee64911Spec

namespace JapanTaxLaw.BatchExcept008ee64911

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept008ee64911
