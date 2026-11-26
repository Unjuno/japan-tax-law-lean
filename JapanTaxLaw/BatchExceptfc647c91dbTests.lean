import JapanTaxLaw.BatchExceptfc647c91dbSpec

namespace JapanTaxLaw.BatchExceptfc647c91db

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptfc647c91db
