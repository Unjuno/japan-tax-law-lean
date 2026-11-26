import JapanTaxLaw.BatchExcept7e9ce76f38Spec

namespace JapanTaxLaw.BatchExcept7e9ce76f38

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7e9ce76f38
