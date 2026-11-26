import JapanTaxLaw.BatchExcept733585eb2eSpec

namespace JapanTaxLaw.BatchExcept733585eb2e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept733585eb2e
