import JapanTaxLaw.BatchExceptbb6d574d7cSpec

namespace JapanTaxLaw.BatchExceptbb6d574d7c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptbb6d574d7c
