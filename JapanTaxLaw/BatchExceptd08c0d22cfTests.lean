import JapanTaxLaw.BatchExceptd08c0d22cfSpec

namespace JapanTaxLaw.BatchExceptd08c0d22cf

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd08c0d22cf
