import JapanTaxLaw.BatchExcepta3f759456eSpec

namespace JapanTaxLaw.BatchExcepta3f759456e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta3f759456e
