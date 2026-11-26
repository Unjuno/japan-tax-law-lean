import JapanTaxLaw.BatchExceptcd1a53b549Spec

namespace JapanTaxLaw.BatchExceptcd1a53b549

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptcd1a53b549
