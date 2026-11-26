import JapanTaxLaw.BatchExcept89af9ecdfbSpec

namespace JapanTaxLaw.BatchExcept89af9ecdfb

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept89af9ecdfb
