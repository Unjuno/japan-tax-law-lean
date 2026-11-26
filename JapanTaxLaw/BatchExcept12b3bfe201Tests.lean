import JapanTaxLaw.BatchExcept12b3bfe201Spec

namespace JapanTaxLaw.BatchExcept12b3bfe201

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept12b3bfe201
