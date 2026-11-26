import JapanTaxLaw.BatchExcept6181b130b7Spec

namespace JapanTaxLaw.BatchExcept6181b130b7

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept6181b130b7
