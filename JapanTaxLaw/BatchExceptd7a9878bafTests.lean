import JapanTaxLaw.BatchExceptd7a9878bafSpec

namespace JapanTaxLaw.BatchExceptd7a9878baf

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd7a9878baf
