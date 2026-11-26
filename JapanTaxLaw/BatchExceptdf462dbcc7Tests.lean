import JapanTaxLaw.BatchExceptdf462dbcc7Spec

namespace JapanTaxLaw.BatchExceptdf462dbcc7

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptdf462dbcc7
