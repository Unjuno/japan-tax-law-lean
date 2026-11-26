import JapanTaxLaw.BatchExceptaa68c77e23Spec

namespace JapanTaxLaw.BatchExceptaa68c77e23

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptaa68c77e23
