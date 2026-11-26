import JapanTaxLaw.BatchExcept1031399d41Spec

namespace JapanTaxLaw.BatchExcept1031399d41

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept1031399d41
