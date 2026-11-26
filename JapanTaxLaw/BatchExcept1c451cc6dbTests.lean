import JapanTaxLaw.BatchExcept1c451cc6dbSpec

namespace JapanTaxLaw.BatchExcept1c451cc6db

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept1c451cc6db
