import JapanTaxLaw.BatchExcept854495c082Spec

namespace JapanTaxLaw.BatchExcept854495c082

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept854495c082
