import JapanTaxLaw.BatchExceptcc695f50edSpec

namespace JapanTaxLaw.BatchExceptcc695f50ed

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptcc695f50ed
