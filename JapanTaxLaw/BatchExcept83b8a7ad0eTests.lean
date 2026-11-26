import JapanTaxLaw.BatchExcept83b8a7ad0eSpec

namespace JapanTaxLaw.BatchExcept83b8a7ad0e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept83b8a7ad0e
