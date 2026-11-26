import JapanTaxLaw.BatchExcept71f5d48df0Spec

namespace JapanTaxLaw.BatchExcept71f5d48df0

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept71f5d48df0
