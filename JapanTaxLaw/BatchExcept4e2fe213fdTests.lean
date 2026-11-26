import JapanTaxLaw.BatchExcept4e2fe213fdSpec

namespace JapanTaxLaw.BatchExcept4e2fe213fd

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept4e2fe213fd
