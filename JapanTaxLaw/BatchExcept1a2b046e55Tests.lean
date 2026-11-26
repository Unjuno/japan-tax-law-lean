import JapanTaxLaw.BatchExcept1a2b046e55Spec

namespace JapanTaxLaw.BatchExcept1a2b046e55

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept1a2b046e55
