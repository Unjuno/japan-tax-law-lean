import JapanTaxLaw.BatchExceptb16b54f063Spec

namespace JapanTaxLaw.BatchExceptb16b54f063

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb16b54f063
