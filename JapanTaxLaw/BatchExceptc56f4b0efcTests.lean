import JapanTaxLaw.BatchExceptc56f4b0efcSpec

namespace JapanTaxLaw.BatchExceptc56f4b0efc

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptc56f4b0efc
