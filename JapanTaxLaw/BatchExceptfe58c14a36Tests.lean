import JapanTaxLaw.BatchExceptfe58c14a36Spec

namespace JapanTaxLaw.BatchExceptfe58c14a36

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptfe58c14a36
