import JapanTaxLaw.BatchExcept8f79954feeSpec

namespace JapanTaxLaw.BatchExcept8f79954fee

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept8f79954fee
