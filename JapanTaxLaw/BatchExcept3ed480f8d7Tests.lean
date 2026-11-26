import JapanTaxLaw.BatchExcept3ed480f8d7Spec

namespace JapanTaxLaw.BatchExcept3ed480f8d7

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept3ed480f8d7
