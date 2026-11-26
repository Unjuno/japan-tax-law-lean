import JapanTaxLaw.BatchExcept4eb280d837Spec

namespace JapanTaxLaw.BatchExcept4eb280d837

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept4eb280d837
