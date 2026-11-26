import JapanTaxLaw.BatchExcept07aa3dcd90Spec

namespace JapanTaxLaw.BatchExcept07aa3dcd90

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept07aa3dcd90
