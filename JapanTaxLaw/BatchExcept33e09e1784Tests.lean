import JapanTaxLaw.BatchExcept33e09e1784Spec

namespace JapanTaxLaw.BatchExcept33e09e1784

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept33e09e1784
