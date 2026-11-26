import JapanTaxLaw.BatchExcept92d8dbb2f4Spec

namespace JapanTaxLaw.BatchExcept92d8dbb2f4

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept92d8dbb2f4
