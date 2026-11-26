import JapanTaxLaw.BatchExcept75cb4850fdSpec

namespace JapanTaxLaw.BatchExcept75cb4850fd

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept75cb4850fd
