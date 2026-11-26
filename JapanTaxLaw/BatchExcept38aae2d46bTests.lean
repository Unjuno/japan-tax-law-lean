import JapanTaxLaw.BatchExcept38aae2d46bSpec

namespace JapanTaxLaw.BatchExcept38aae2d46b

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept38aae2d46b
