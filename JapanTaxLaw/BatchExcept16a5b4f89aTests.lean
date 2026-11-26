import JapanTaxLaw.BatchExcept16a5b4f89aSpec

namespace JapanTaxLaw.BatchExcept16a5b4f89a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept16a5b4f89a
