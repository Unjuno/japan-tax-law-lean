import JapanTaxLaw.BatchExcept89ff77082eSpec

namespace JapanTaxLaw.BatchExcept89ff77082e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept89ff77082e
