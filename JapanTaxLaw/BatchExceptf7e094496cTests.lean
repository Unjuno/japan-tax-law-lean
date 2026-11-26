import JapanTaxLaw.BatchExceptf7e094496cSpec

namespace JapanTaxLaw.BatchExceptf7e094496c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf7e094496c
