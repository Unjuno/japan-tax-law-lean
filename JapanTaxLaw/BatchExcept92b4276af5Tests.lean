import JapanTaxLaw.BatchExcept92b4276af5Spec

namespace JapanTaxLaw.BatchExcept92b4276af5

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept92b4276af5
