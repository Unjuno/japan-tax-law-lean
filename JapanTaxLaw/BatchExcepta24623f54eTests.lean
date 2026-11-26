import JapanTaxLaw.BatchExcepta24623f54eSpec

namespace JapanTaxLaw.BatchExcepta24623f54e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta24623f54e
