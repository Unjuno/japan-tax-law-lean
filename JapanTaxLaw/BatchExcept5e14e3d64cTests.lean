import JapanTaxLaw.BatchExcept5e14e3d64cSpec

namespace JapanTaxLaw.BatchExcept5e14e3d64c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept5e14e3d64c
