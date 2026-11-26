import JapanTaxLaw.BatchExceptd5518fd544Spec

namespace JapanTaxLaw.BatchExceptd5518fd544

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd5518fd544
