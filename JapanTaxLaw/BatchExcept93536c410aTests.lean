import JapanTaxLaw.BatchExcept93536c410aSpec

namespace JapanTaxLaw.BatchExcept93536c410a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept93536c410a
