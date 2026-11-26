import JapanTaxLaw.BatchExcept2c86d4988eSpec

namespace JapanTaxLaw.BatchExcept2c86d4988e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept2c86d4988e
