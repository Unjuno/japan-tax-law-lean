import JapanTaxLaw.BatchExceptf35702a812Spec

namespace JapanTaxLaw.BatchExceptf35702a812

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf35702a812
