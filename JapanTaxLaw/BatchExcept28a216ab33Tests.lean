import JapanTaxLaw.BatchExcept28a216ab33Spec

namespace JapanTaxLaw.BatchExcept28a216ab33

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept28a216ab33
