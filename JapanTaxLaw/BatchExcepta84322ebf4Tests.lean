import JapanTaxLaw.BatchExcepta84322ebf4Spec

namespace JapanTaxLaw.BatchExcepta84322ebf4

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta84322ebf4
