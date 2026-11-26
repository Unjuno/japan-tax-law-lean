import JapanTaxLaw.BatchExceptcc94450c2eSpec

namespace JapanTaxLaw.BatchExceptcc94450c2e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptcc94450c2e
