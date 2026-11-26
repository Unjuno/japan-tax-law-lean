import JapanTaxLaw.BatchExcept94018287bbSpec

namespace JapanTaxLaw.BatchExcept94018287bb

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept94018287bb
