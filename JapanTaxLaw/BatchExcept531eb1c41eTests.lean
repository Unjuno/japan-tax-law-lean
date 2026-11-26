import JapanTaxLaw.BatchExcept531eb1c41eSpec

namespace JapanTaxLaw.BatchExcept531eb1c41e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept531eb1c41e
