import JapanTaxLaw.BatchExcept620b077782Spec

namespace JapanTaxLaw.BatchExcept620b077782

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept620b077782
