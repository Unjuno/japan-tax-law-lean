import JapanTaxLaw.BatchExcept20a92e45cfSpec

namespace JapanTaxLaw.BatchExcept20a92e45cf

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept20a92e45cf
