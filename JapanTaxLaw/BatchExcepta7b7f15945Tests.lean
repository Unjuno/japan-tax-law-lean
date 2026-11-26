import JapanTaxLaw.BatchExcepta7b7f15945Spec

namespace JapanTaxLaw.BatchExcepta7b7f15945

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta7b7f15945
