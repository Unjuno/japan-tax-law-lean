import JapanTaxLaw.BatchExcept1107f8b974Spec

namespace JapanTaxLaw.BatchExcept1107f8b974

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept1107f8b974
