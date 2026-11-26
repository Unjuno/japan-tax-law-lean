import JapanTaxLaw.BatchExcept7245161c5bSpec

namespace JapanTaxLaw.BatchExcept7245161c5b

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7245161c5b
