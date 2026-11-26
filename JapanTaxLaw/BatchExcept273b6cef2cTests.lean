import JapanTaxLaw.BatchExcept273b6cef2cSpec

namespace JapanTaxLaw.BatchExcept273b6cef2c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept273b6cef2c
