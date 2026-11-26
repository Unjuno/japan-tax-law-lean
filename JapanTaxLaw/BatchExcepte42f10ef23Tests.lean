import JapanTaxLaw.BatchExcepte42f10ef23Spec

namespace JapanTaxLaw.BatchExcepte42f10ef23

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepte42f10ef23
