import JapanTaxLaw.BatchExcept81704df37cSpec

namespace JapanTaxLaw.BatchExcept81704df37c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept81704df37c
