import JapanTaxLaw.BatchExcept2684bdc8c4Spec

namespace JapanTaxLaw.BatchExcept2684bdc8c4

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept2684bdc8c4
