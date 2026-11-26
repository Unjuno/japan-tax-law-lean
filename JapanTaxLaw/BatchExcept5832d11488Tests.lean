import JapanTaxLaw.BatchExcept5832d11488Spec

namespace JapanTaxLaw.BatchExcept5832d11488

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept5832d11488
