import JapanTaxLaw.BatchExceptec02f9800eSpec

namespace JapanTaxLaw.BatchExceptec02f9800e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptec02f9800e
