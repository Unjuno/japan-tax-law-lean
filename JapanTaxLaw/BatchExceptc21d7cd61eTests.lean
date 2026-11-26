import JapanTaxLaw.BatchExceptc21d7cd61eSpec

namespace JapanTaxLaw.BatchExceptc21d7cd61e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptc21d7cd61e
