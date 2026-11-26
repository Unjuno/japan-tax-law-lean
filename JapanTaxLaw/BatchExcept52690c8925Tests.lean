import JapanTaxLaw.BatchExcept52690c8925Spec

namespace JapanTaxLaw.BatchExcept52690c8925

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept52690c8925
