import JapanTaxLaw.BatchExcept8b5e10e86dSpec

namespace JapanTaxLaw.BatchExcept8b5e10e86d

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept8b5e10e86d
