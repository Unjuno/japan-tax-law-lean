import JapanTaxLaw.BatchExcept5b6c9040dbSpec

namespace JapanTaxLaw.BatchExcept5b6c9040db

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept5b6c9040db
