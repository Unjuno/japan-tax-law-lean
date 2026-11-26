import JapanTaxLaw.BatchExceptd1decfba63Spec

namespace JapanTaxLaw.BatchExceptd1decfba63

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd1decfba63
