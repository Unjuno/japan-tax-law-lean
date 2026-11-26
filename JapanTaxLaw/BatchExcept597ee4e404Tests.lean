import JapanTaxLaw.BatchExcept597ee4e404Spec

namespace JapanTaxLaw.BatchExcept597ee4e404

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept597ee4e404
