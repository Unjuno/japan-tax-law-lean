import JapanTaxLaw.BatchExcept2ada3b350bSpec

namespace JapanTaxLaw.BatchExcept2ada3b350b

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept2ada3b350b
