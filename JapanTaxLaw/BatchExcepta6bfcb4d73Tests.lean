import JapanTaxLaw.BatchExcepta6bfcb4d73Spec

namespace JapanTaxLaw.BatchExcepta6bfcb4d73

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta6bfcb4d73
