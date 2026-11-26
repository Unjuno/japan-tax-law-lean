import JapanTaxLaw.BatchExcepta48414a06aSpec

namespace JapanTaxLaw.BatchExcepta48414a06a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta48414a06a
