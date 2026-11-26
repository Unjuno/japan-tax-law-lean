import JapanTaxLaw.BatchExcept152e25779bSpec

namespace JapanTaxLaw.BatchExcept152e25779b

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept152e25779b
