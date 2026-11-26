import JapanTaxLaw.BatchExcepta943e7598aSpec

namespace JapanTaxLaw.BatchExcepta943e7598a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta943e7598a
