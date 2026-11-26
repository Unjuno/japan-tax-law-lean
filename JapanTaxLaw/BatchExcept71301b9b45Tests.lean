import JapanTaxLaw.BatchExcept71301b9b45Spec

namespace JapanTaxLaw.BatchExcept71301b9b45

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept71301b9b45
