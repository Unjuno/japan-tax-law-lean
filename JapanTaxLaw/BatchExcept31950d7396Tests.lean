import JapanTaxLaw.BatchExcept31950d7396Spec

namespace JapanTaxLaw.BatchExcept31950d7396

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept31950d7396
