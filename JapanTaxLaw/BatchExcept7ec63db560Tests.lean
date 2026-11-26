import JapanTaxLaw.BatchExcept7ec63db560Spec

namespace JapanTaxLaw.BatchExcept7ec63db560

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7ec63db560
