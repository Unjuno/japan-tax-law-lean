import JapanTaxLaw.BatchExcept2b43d9d0d7Spec

namespace JapanTaxLaw.BatchExcept2b43d9d0d7

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept2b43d9d0d7
