import JapanTaxLaw.BatchExceptf35ee7d9fdSpec

namespace JapanTaxLaw.BatchExceptf35ee7d9fd

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf35ee7d9fd
