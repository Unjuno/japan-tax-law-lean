import JapanTaxLaw.BatchExceptf6f02cb01aSpec

namespace JapanTaxLaw.BatchExceptf6f02cb01a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf6f02cb01a
