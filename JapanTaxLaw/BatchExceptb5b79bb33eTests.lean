import JapanTaxLaw.BatchExceptb5b79bb33eSpec

namespace JapanTaxLaw.BatchExceptb5b79bb33e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb5b79bb33e
