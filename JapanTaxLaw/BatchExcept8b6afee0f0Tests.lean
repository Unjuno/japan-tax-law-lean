import JapanTaxLaw.BatchExcept8b6afee0f0Spec

namespace JapanTaxLaw.BatchExcept8b6afee0f0

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept8b6afee0f0
