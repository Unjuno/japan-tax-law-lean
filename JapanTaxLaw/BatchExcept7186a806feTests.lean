import JapanTaxLaw.BatchExcept7186a806feSpec

namespace JapanTaxLaw.BatchExcept7186a806fe

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7186a806fe
