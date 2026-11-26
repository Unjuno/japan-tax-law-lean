import JapanTaxLaw.BatchExcept59d362ce56Spec

namespace JapanTaxLaw.BatchExcept59d362ce56

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept59d362ce56
