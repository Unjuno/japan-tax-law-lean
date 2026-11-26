import JapanTaxLaw.BatchExcept02cf2799a3Spec

namespace JapanTaxLaw.BatchExcept02cf2799a3

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept02cf2799a3
