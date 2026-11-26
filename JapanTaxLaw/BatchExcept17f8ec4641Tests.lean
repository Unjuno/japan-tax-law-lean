import JapanTaxLaw.BatchExcept17f8ec4641Spec

namespace JapanTaxLaw.BatchExcept17f8ec4641

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept17f8ec4641
