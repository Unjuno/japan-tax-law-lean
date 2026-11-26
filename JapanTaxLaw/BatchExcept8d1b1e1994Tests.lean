import JapanTaxLaw.BatchExcept8d1b1e1994Spec

namespace JapanTaxLaw.BatchExcept8d1b1e1994

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept8d1b1e1994
