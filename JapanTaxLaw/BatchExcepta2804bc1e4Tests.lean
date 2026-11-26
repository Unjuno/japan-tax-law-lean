import JapanTaxLaw.BatchExcepta2804bc1e4Spec

namespace JapanTaxLaw.BatchExcepta2804bc1e4

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta2804bc1e4
