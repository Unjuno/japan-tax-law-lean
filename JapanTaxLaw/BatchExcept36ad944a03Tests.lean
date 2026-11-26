import JapanTaxLaw.BatchExcept36ad944a03Spec

namespace JapanTaxLaw.BatchExcept36ad944a03

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept36ad944a03
