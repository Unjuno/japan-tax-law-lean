import JapanTaxLaw.BatchExcept30a60e5ddbSpec

namespace JapanTaxLaw.BatchExcept30a60e5ddb

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept30a60e5ddb
