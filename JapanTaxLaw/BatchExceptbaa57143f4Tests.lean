import JapanTaxLaw.BatchExceptbaa57143f4Spec

namespace JapanTaxLaw.BatchExceptbaa57143f4

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptbaa57143f4
