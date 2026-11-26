import JapanTaxLaw.BatchExcept9ef706443eSpec

namespace JapanTaxLaw.BatchExcept9ef706443e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept9ef706443e
