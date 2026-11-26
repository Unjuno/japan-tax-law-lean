import JapanTaxLaw.BatchExceptb76561da83Spec

namespace JapanTaxLaw.BatchExceptb76561da83

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb76561da83
