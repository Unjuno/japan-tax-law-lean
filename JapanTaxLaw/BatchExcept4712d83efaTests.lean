import JapanTaxLaw.BatchExcept4712d83efaSpec

namespace JapanTaxLaw.BatchExcept4712d83efa

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept4712d83efa
