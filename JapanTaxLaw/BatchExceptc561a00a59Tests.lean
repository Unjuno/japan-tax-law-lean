import JapanTaxLaw.BatchExceptc561a00a59Spec

namespace JapanTaxLaw.BatchExceptc561a00a59

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptc561a00a59
