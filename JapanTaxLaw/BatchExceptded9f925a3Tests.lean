import JapanTaxLaw.BatchExceptded9f925a3Spec

namespace JapanTaxLaw.BatchExceptded9f925a3

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptded9f925a3
