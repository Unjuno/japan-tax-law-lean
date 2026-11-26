import JapanTaxLaw.BatchExceptb72b5ba090Spec

namespace JapanTaxLaw.BatchExceptb72b5ba090

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb72b5ba090
