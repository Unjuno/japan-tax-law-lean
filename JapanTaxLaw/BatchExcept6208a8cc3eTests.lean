import JapanTaxLaw.BatchExcept6208a8cc3eSpec

namespace JapanTaxLaw.BatchExcept6208a8cc3e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept6208a8cc3e
