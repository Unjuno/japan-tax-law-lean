import JapanTaxLaw.BatchExcept593e61a8cdSpec

namespace JapanTaxLaw.BatchExcept593e61a8cd

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept593e61a8cd
